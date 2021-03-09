<template>
  <div class="noticePub">
    <div class="form" style="width:500px">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
      <el-form-item label="标题" prop='title'>
        <el-input v-model="form.title"></el-input>
      </el-form-item>
      <el-form-item label="内容" prop='content'>
        <el-input v-model="form.content" type="textarea" :rows="12"></el-input>
      </el-form-item>
    </el-form>
    <el-row :gutter="20">
      <el-col :span="4" :offset='4'>
        <el-button type="primary" @click="handleOk">发布</el-button>
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
        title: "",
        content: "",
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
  methods:{
    handleOk(){
      this.$refs['form'].validate(async(valid) => {
          if (valid) {
            let {data:res}=await this.$http.post('/notice/addNotice',this.form)
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