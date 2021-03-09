<template>
  <div class="noticePub">
    <div class="form" style="width:500px">
            
      <el-form ref="form" :disabled='disabled' :model="form" label-width="80px" :rules="rules">
          <el-form-item label="部门名称" prop='deptName'>
        <el-input v-model="form.deptName"></el-input>
      </el-form-item>
      <el-form-item label="负责人编号" prop='studentId'>
        <el-input v-model="form.studentId"></el-input>
      </el-form-item>
            <el-form-item label="负责人" prop='name'>
        <el-input v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="所属学院" prop='college'>
        <el-input v-model="form.college"></el-input>
      </el-form-item>
      <el-form-item label="所属专业" prop='major'>
        <el-input v-model="form.major" ></el-input>
      </el-form-item>
      <el-form-item label="联系电话" prop='deptPhone'>
        <el-input v-model="form.deptPhone"></el-input>
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
        college: "",
        name: "",
        deptName:'',
        major:'',
        deptPhone:"",
        studentId:''
      },
       rules:{
        name:[
          { required: true, message: '请输入公告标题', trigger: 'blur' },
        ],
        deptName:[
          { required: true, message: '请输入公告内容', trigger: 'blur' },
        ],
        studentId:[
          { required: true, message: '请输入负责人Id', trigger: 'blur' },
        ],
        major:[
          { required: true, message: '请输入所属专业', trigger: 'blur' },
        ],
        college:[
          { required: true, message: '请输入所属学院', trigger: 'blur' },
        ],
        deptPhone:[
          { required: true, message: '请输入联系电话', trigger: 'blur' },
        ],
      },
      disabled:true
    };
  },
  created(){
      this.getList()
  },
  methods:{
       async getList() {
      let { data: res } = await this.$http.get(
        `/department/getMessage`);
      console.log(res);
      if (res.code == 100) {
        this.form = res.extend.result;
      }
    },
    handleEdit(){
        this.disabled=false
    },
    handleOk(){
        this.$refs['form'].validate(async(valid) => {
          if (valid) {
            let {data:res}=await this.$http.post('/department/updateMessage',this.form)
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