<template>
  <div class="noticePub">
    <div class="form" style="width:500px">
            
      <el-form ref="form" :model="form" label-width="80px" :rules="rules" >
       <el-form-item label="学院" prop='college'>
        <el-input v-model="form.college" disabled></el-input>
      </el-form-item>
      <el-form-item label="专业" prop='major'>
        <el-input v-model="form.major" disabled></el-input>
      </el-form-item>
      <el-form-item label="学号" prop='studentId'>
        <el-input v-model="form.studentId" disabled></el-input>
      </el-form-item>
            <el-form-item label="姓名" prop='name'>
        <el-input v-model="form.name" disabled></el-input>
      </el-form-item>
      <el-form-item label="联系电话" prop='phone'>
        <el-input v-model="form.phone" disabled></el-input>
      </el-form-item>
      <el-form-item label="密码" prop='password' >
        <el-input v-model="form.password" :disabled='disabled' ></el-input>
      </el-form-item>
    </el-form> 
    <el-row :gutter="20">
      <el-col :span="4" :offset='4'>
        <el-button type="primary" @click="handleEdit">编辑</el-button>
      </el-col>
      <el-col :span="4" :offset='4'>
        <el-button type="primary" @click="handleOk">确定</el-button>
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
        password:''
      },
       rules:{
        password:[
          { required: true, message: '请填写密码', trigger: 'blur' },
        ],
      },
      disabled:true,
      oldPassword:'',
      newPassword:''
    };
  },
  created(){
      this.getList()
  },
  methods:{
       async getList() {
      let { data: res } = await this.$http.get(
        `/user/getMessage`);
      console.log(res);
      if (res.code == 100) {
        this.form = res.extend.result;
        this.oldPassword=res.extend.result.password
      }
    },
    handleEdit(){
        this.disabled=false        
    },
    handleOk(){
        this.$refs['form'].validate(async(valid) => {
          if (valid) {
              let formData=Object.assign({},{oldPassword:this.oldPassword,newPassword:this.form.password})
              console.log(formData)
            let {data:res}=await this.$http.post('/updatePassword',formData)
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