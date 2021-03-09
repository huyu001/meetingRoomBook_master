<template>
  <div>
    <a @click="handleSign">签到</a>
    <!-- 签到对话框 -->
    <el-dialog title="签到" :visible.sync="dialogVisible" width="30%">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
        <el-form-item label="签到码" prop="random">
          <el-input v-model="form.random"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleDialogConfirm('form')"
          >确 定</el-button
        >
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
        random: "",
      },
      rules: {
        random: [{ required: true, message: "请输入签到码", trigger: "blur" }],
      },
    };
  },
  methods: {
    handleSign() {
      console.log("签到");
      console.log(this.applicationId)
      this.dialogVisible = true;
    },
    handleDialogConfirm(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          this.dialogVisible = false;
          const { data: res } = await this.$http.post("/user/sign", {
            applicationId: this.applicationId,
            random: this.form.random,
          });
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
  },
};
</script>

<style>
</style>