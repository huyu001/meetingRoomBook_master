<template>
  <div>
    <a @click="handleClick">查看文件</a>
    <!-- 签到对话框 -->
    <el-dialog
      :title="`${data.meetingTheme}_文件列表`"
      :visible.sync="dialogVisible"
      width="30%"
      @close="dialogVisible = false"
    >
      <div class="fileList">
        <div v-for="item in fileList" :key="item.id">
          <a @click="handleDownload(item)">{{ item.oldFileName }}</a>
          <span @click="handleDelete(item.id)" class="delete">×</span>
        </div>
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
      fileList: [],
    };
  },
  methods: {
    async getList(){
    const { data: res } = await this.$http.get(`/file/selectByApplicationId/${this.data.applicationId}`);
      console.log(res);
      this.fileList = res.extend.result;
    },
     handleClick() {
      this.dialogVisible = true;
     this.getList()
    },
    async handleDownload(data) {
      const { data: res } = await this.$http({
        url:`/file/download/${data.id}`,
        responseType: 'blob',
        data:{},
        method: "post",
      });
      let blob = new Blob([res]);
      let link = document.createElement("a");
      link.href = window.URL.createObjectURL(blob);
      link.download = data.oldFileName;
      link.click();
    },
    async handleDelete(id){
            const { data: res } = await this.$http.get(`/file/delete/${id}`)
            this.getList()
    }
  },
};
</script>

<style lang="less" scoped>
.fileList>div{
  display: flex;
  
}
.fileList{
  a {
    display: block;
    width: 90%;
    .delete{
      display: inline-block;
      width: 10%;
      color: aqua;
    }
  }
}
</style>