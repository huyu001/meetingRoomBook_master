<template>
    <div>
        <el-table
      :data="tableData"
      stripe
      style="width: 100%">
      <el-table-column
        prop="meetingTheme"
        label="会议主题"
        width="180">
      </el-table-column>
      <el-table-column
        prop="userId"
        label="姓名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="reason"
        label="原因"
        width:='180'>
      </el-table-column>
      <el-table-column
        label="状态"
        width:='180'>
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <span size="medium">{{ scope.row.absent?(scope.row.absent==1?'拒绝':'待审批'):'同意' }}</span>
          </div>
      </template>
      </el-table-column>
      <el-table-column
        label="操作">
        <template slot-scope="scope">
            <div v-if="scope.row.absent!=2">
              <el-button type="primary" size="small" @click="agree(scope.row)" v-show="scope.row.absent==1">同意</el-button>
              <el-button type="danger" size="small" @click="refuse(scope.row)" v-show="scope.row.absent==0">拒绝</el-button>
            </div>
            <div v-else>
              <el-button type="primary" size="small" @click="agree(scope.row)" >同意</el-button>
              <el-button type="danger" size="small" @click="refuse(scope.row)" class="refuseBtn">拒绝</el-button>
            </div>
        </template>
        
      </el-table-column>
    </el-table>
    </div>
  </template>

  <script>
export default {
  data() {
    return {
      tableData: [],
    };
  },
  created(){
    this.getLeaveInfo()
  },
  methods: {
    async getLeaveInfo(){
      const { data: res } = await this.$http.get(`/apply/leave/${this.$route.params.id}`);
      console.log(res)
      if(res.code==100){
        this.tableData=res.extend.result
      }
    },
    agree(value) {
        console.log(value)
      this.$confirm("此操作将同意该成员的请假, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(async () => {
           const { data: res } = await this.$http.get("/agree/apply/leave/"+value.id+'/'+value.userId);
          if(res.code==100){
             this.$message({
             type: "success",
             message: "操作成功!",
          });
          this.getLeaveInfo()
          }
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消该操作",
          });
        });
    },
     refuse(value) {
      console.log(value)
      this.$confirm("此操作将拒绝该成员的请假, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(async () => {
          const { data: res } = await this.$http.get("/refuse/apply/leave/"+value.id+'/'+value.userId);
          if(res.code==100){
             this.$message({
             type: "success",
             message: "操作成功!",
          });
          this.getLeaveInfo()
          }
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消该操作",
          });
        });
    },
  },
};
</script>
<style scoped>
  .el-button+.el-button {
    margin-left: 0px;
}
</style>