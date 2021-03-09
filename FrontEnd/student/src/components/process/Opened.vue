<template>
  <div>
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="开启签到" name="signIn" class="signIn">
        <el-switch
          v-model="value1"
          active-text="开启签到"
          inactive-text="关闭签到"
          @change="handleSwitchOChange"
        >
        </el-switch>
        <div class="sign_num">
          签到码：<span
            :style="{ color: this.statusSignIn ? '#409EFF' : 'gray' }"
            >{{ signONum }}</span
          >
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      activeName: "signIn",
      value1: false,
      signONum: "开启签到后生成",
      statusSignIn: false,
    };
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
    async handleSwitchOChange(status) {
      if (status) {
        const { data: res } = await this.$http.get("/start/sign/27");
        if (res.code == 100) {
          this.$message.success(res.message);
          this.signONum = res.extend.sign;
        }
      } else {
        const { data: res } = await this.$http.get("/stop/sign/27");
        res.code == 100 && this.$message.success(res.message);
        this.signONum = "开启签到后生成";
      }
      this.statusSignIn = status;
    },
  },
};
</script>
<style scoped>
.signIn {
  text-align: start;
}
.sign_num {
  margin-top: 15px;
  font-size: 16px;
}
</style>