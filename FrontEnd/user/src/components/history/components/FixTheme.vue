<template>
  <div>
    <a @click="handleTheme">修改会议主题</a>
    <!-- 签到对话框 -->
    <el-dialog
      title="修改会议主题"
      :visible.sync="dialogVisible"
      width="30%"
      @open="resetFields"
    >
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
        <el-form-item label="活动主题" prop="meetingTheme">
          <el-input v-model="form.meetingTheme"></el-input>
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
  props: ["data", "getList"],
  data() {
    return {
      dialogVisible: false,
      form: {
        meetingTheme: "",
      },
      rules: {
        meetingTheme: [{ required: true, message: "请输入活动主题", trigger: "blur" }],
      },
    };
  },
  created() {
    this.form.meetingTheme = this.data.meetingTheme;
  },

  methods: {
    handleTheme() {
      this.dialogVisible = true;
    },
     handleDialogConfirm(formName) {
        this.$refs[formName].validate(async (valid) => {
        if (valid) {
            this.dialogVisible = false;
            const { data: res } = await this.$http.post("/apply/update", {
            applicationId: this.data.applicationId,
            meetingTheme: this.form.meetingTheme,
        });
            this.getList();
        } else {
            console.log('error submit!!');
            return false;
        }
    });
      
    },
    resetFields() {
      this.form.meetingTheme = this.data.meetingTheme;
    },
  },
};
</script>

<style>
</style>