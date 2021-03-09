<template>
  <div class="noticePub">
    <div class="form" style="width:500px">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
          <el-form-item label="学号" prop='studentId'>
        <el-input v-model="form.studentId"></el-input>
      </el-form-item>
      <el-form-item label="账号名" prop='username'>
        <el-input v-model="form.username"></el-input>
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
    <el-row :gutter="20">
      <el-col :span="4" :offset='4'>
        <el-button type="primary" @click="handleOk">确定</el-button>
      </el-col>
      <el-col :span="4" :offset='4'>
        <el-button>取消</el-button>
      </el-col>
    </el-row>
    </div>
    
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: "",
        major: "",
        studentId:'',
        college:'',
        phone:"",
        username:''
      },
      rules:{
         username:[
          { required: true, message: '请输入账号名', trigger: 'blur' },
        ],
        name:[
          { required: true, message: '请输入姓名', trigger: 'blur' },
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
  methods:{
    handleOk(){
      this.$refs['form'].validate(async(valid) => {
          if (valid) {
            let {data:res}=await this.$http.post('/user/addUser',this.form)
            if(res.code==100) return this.$message.success(res.message)
          } else {
            console.log('error submit!!');
            return false;
          }
        });
    }
  }
};
</script>

<style>
</style>