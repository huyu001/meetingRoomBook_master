<template>
  <div>
    <a @click="handleSignIn" >签到</a>
    <!-- 签到对话框 -->
    <el-dialog
      title="签到"
      :visible.sync="dialogVisible"
      width="30%"
      @close="handleDialogClose"
    >
      <el-switch
        v-model="value1"
        active-text="开启签到"
        inactive-text="关闭签到"
        @change="handleSwitchOChange"
        :disabled="switchDisabled"
      >
      </el-switch>
      <div class="sign_num">
        签到码：<span :style="{ color: statusSignIn ? '#409EFF' : 'gray' }">{{
          signONum
        }}</span>
      </div>
      <div style="margin: 20px 0 0 0">
        会议出勤率：<span
          :style="{ color: statusSignIn ? 'gray' : '#409EFF' }"
          >{{ attendanceRate }}</span
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  props: ["data"],
  data() {
    return {
      dialogVisible: false,
      value1: false,
      signONum: "开启签到后生成",
      statusSignIn: false,
      attendanceRate: 0,
      switchDisabled: false,
    };
  },
  methods: {
    async handleSwitchOChange(status) {
      if (status) {
        const { data: res } = await this.$http.get(
          `/start/sign/${this.data.applicationId}`
        );
        if (res.code == 100) {
          this.$message.success(res.message);
          this.signONum = res.extend.sign;
        }
      } else {
        const { data: res } = await this.$http.get(
          `/start/sign/${this.data.applicationId}`
        );
        const { data: rate } = await this.$http.get(
          `/attendanceRate/${this.data.applicationId}`
        );
        console.log(rate);
        res.code == 100 && this.$message.success(res.message);
        if (rate.code == 100) {
          this.attendanceRate = rate.extend.出勤率;
        }
      }
      this.statusSignIn = status;
      this.switchDisabled = false;
      if (!status) {
        this.switchDisabled = true;
      }
    },
    handleDialogClose() {
      console.log(this);
      // this.value1 = false;
      // this.signONum = "开启签到后生成";
      // this.statusSignIn = false;
      // this.attendanceRate = 0;
      this.$emit('backToFather',this.attendanceRate)
    },
    handleSignIn() {
      console.log(this.data);
      this.dialogVisible = true;
    },
  },
};
</script>

<style>
</style>