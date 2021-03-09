<template>
  <div class="editData">
    <el-button type="text" @click="handleEdit">修改</el-button>
    <el-dialog title="提示" :visible="dialogVisible" width="50%">
       <div class="form" style="width:500px">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
      <el-form-item label="标题" prop='title'>
        <el-input v-model="form.title"></el-input>
      </el-form-item>
      <el-form-item label="内容" prop='content'>
        <el-input v-model="form.content" type="textarea" :rows="12"></el-input>
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
  props: ["data","getList"],
  data() {
    return {
      dialogVisible: false,
      form: {
        title: "",
        content: "",
        id: "",
      },
       rules:{
        title:[
          { required: true, message: '请输入公告标题', trigger: 'blur' },
           { min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
        ],
        content:[
          { required: true, message: '请输入公告内容', trigger: 'blur' },
        ]
      }
    };
  },
  methods: {
    handleEdit() {
      this.dialogVisible = true;
      Object.assign(this.form, {
        id: this.data.id,
        title: this.data.title,
        content: this.data.content,
      });
      console.log(this.form);
    },
    handleOk() {
      this.dialogVisible = false;
       this.$refs['form'].validate(async(valid) => {
          if (valid) {
            let {data:res}=await this.$http.post('/notice/updateNotice',this.form)
            if(res.code==100) {
                 this.$message.success(res.message)
                 this.getList()
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
    },
  },
};
</script>

<style>
</style>