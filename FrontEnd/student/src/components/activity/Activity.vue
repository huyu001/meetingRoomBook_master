<template>
  <div>
    <div class="header">
      <el-form ref="form" :model="form" label-width="80px">
        <el-row>
          <el-col :span="6">
            <el-form-item label="参加状态" label-width="80px">
              <el-select
                v-model="form.absent"
                placeholder="请选择活动区域"
                @change="handleSelectChange"
              >
                <el-option label="请选择参加状态" value=""></el-option>
                <el-option label="已参加" value="0"></el-option>
                <el-option label="缺席" value="1"></el-option>
                <el-option label="待参加" value="2"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <div class="content">
      <el-table :data="tableData" style="width: 100%">
        <el-table-column prop="deptName" label="部门名称" width="180">
        </el-table-column>
        <el-table-column prop="meetingTheme" label="会议主题" width="180">
        </el-table-column>
        <el-table-column prop="roomNo" label="会议室ID" width="180">
        </el-table-column>
        <el-table-column prop="absent" label="参加状态" width="180">
          <template slot-scope="scope">
            <span v-if="scope.row.absent==0">已参加</span>
            <span v-if="scope.row.absent==1">缺席</span>
            <span v-if="scope.row.absent==2">待参加</span>
          </template>
        </el-table-column>
        <el-table-column prop="pending" label="请假状态" width="180">
          <template slot-scope="scope">
            <span v-if="scope.row.pending==0">拒绝</span>
            <span v-if="scope.row.pending==1">通过</span>
            <span v-if="scope.row.pending==2">待审核</span>
            <span v-if="scope.row.pending==3">未提交请假</span>
          </template>
        </el-table-column>
        <el-table-column label="会议时间" width="180">
          <template slot-scope="scope">
            <div>
              {{ $moment(scope.row.meetingDate).format("YYYY/MM/DD") }}
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="isStart" label="会议状态" width="180">
          <template slot-scope="scope">
            <span v-if="scope.row.isStart==3">已过期</span>
            <span v-else-if="scope.row.isStart==1" >签到中</span>
            <span v-else-if="scope.row.isStart==2">进行中</span>
            <span v-else>未开始</span>

          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <file-list :data='scope.row'></file-list>
            <Sign :applicationId="scope.row.applyId" :getList="getList" v-show="scope.row.absent==2&&scope.row.isStart!=3"></Sign>
            <Leave :applicationId="scope.row.applyId" :getList="getList" v-show="scope.row.absent==2&&scope.row.isStart!=3"></Leave>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页区域 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="form.currentPage"
        :page-sizes="[2, 4, 8, 10]"
        :page-size="form.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import Sign from "./components/Sign";
import Leave from './components/Leave'
import FileList from './components/FileList'
export default {
  components: {
    Sign,
    Leave,
    FileList
  },
  data(){
    return {
      tableData: [],
      total: 0,
      form: {
        absent: "",
        pageSize: 4,
        currentPage: 1,
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    async getList() {
      console.log(this.form)
      const { data: res } = await this.$http.get("/user/meeting", {
        params: this.form,
      });
      console.log(res);
      if (res.code !== 100) {
        return this.$message.error("获取会议列表失败！");
      }
      this.tableData = res.extend.result.list;
      this.total = res.extend.result.total;
    },
    handleSizeChange(newSize) {
      this.form.pageSize = newSize;
      this.getList();
    },
    handleCurrentChange(newPage) {
      this.form.currentPage = newPage;
      this.getList();
    },
    handleSelectChange(val) {
      this.form.absent = val;
      this.getList();
    },
  },
};
</script>

<style>
</style>