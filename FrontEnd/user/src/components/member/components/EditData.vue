<template>
  <div class="editData">
    <el-button type="text" @click="handleEdit">修改</el-button>
    <el-dialog title="编辑" :visible.sync="dialogVisible" width="50%">
      <div class="form" style="width: 500px">
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
          <el-form-item label="学号" prop='studentId'>
        <el-input v-model="form.studentId"></el-input>
      </el-form-item>
      <el-form-item label="姓名" prop='name'>
        <el-input v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="学院" prop='major'>
        <el-input v-model="form.major"></el-input>
      </el-form-item>
      <el-form-item label="专业" prop='college'>
        <el-input v-model="form.college" ></el-input>
      </el-form-item>
      <el-form-item label="联系电话" prop='phone'>
        <el-input v-model="form.phone"></el-input>
      </el-form-item>
    </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleOk">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  props: ["data", "getList"],
  data() {
    return {
      dialogVisible: false,
       form: {
        name: "",
        major: "",
        studentId:'',
        college:'',
        phone:""
      },
      rules:{
        name:[
          { required: true, message: '请输入学生姓名', trigger: 'blur' },
        ],
        major:[
          { required: true, message: '请输入学院', trigger: 'blur' },
        ],
        studentId:[
          { required: true, message: '请输入学号', trigger: 'blur' },
        ],
        college:[
          { required: true, message: '请输入专业', trigger: 'blur' },
        ],
        phone:[
          { required: true, message: '请输入联系电话', trigger: 'blur' },
        ]
      }
    };
  },
  methods: {
    handleEdit() {
      this.dialogVisible = true;
      Object.assign(this.form, {
        name: this.data.name,
        studentId: this.data.studentId,
        college: this.data.college,
        major: this.data.major,
        id:this.data.id,
        phone: this.data.phone,
        username: this.data.username
      });
      console.log(this.form);
    },
    handleOk() {
      this.dialogVisible = false;
      this.$refs["form"].validate(async (valid) => {
        if (valid) {
          let { data: res } = await this.$http.post(
            "/user/updateUser",this.form);
          if (res.code == 100) {
            this.$message.success(res.message);
            this.getList();
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>

<style>
</style>