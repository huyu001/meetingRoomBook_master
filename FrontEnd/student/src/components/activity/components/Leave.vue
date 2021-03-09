<template>
  <div>
    <a @click="handleLeave">请假</a>
    <!-- 签到对话框 -->
    <el-dialog title="请假" :visible.sync="dialogVisible" width="30%">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
        <el-form-item label="请假原因" prop="reason">
          <el-input v-model="form.reason"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleDialogConfirm('form')">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  props: ["applicationId","getList"],
  data() {
    return {
      dialogVisible: false,
      form: {
        reason: "",
      },
      rules: {
        reason: [
          { required: true, message: "请输入请假原因", trigger: "blur" },
        ],
      },
    };
  },
  methods:{
      handleLeave(){
          this.dialogVisible=true
      },
       handleDialogConfirm(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          this.dialogVisible = false;
          const { data: res } = await this.$http.post("/user/askLeave", Object.assign(this.form,{applicationId:this.applicationId}));
          if (res.code == 200) {
            this.$message.error(res.message);
          } else {
            this.$message.success(res.message);
          }
          this.getList()
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  }
};
</script>

<style>
</style>