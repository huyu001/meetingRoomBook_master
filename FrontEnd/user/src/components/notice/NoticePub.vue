<template>
  <div class="noticeReceive">
    <!-- 查询区域 -->
    <el-form :inline="true" :model="formInline" class="demo-form-inline">
      <el-form-item label="标题">
        <el-input
          v-model="formInline.title"
          placeholder="请输入标题"
        ></el-input>
      </el-form-item>
      <el-form-item label="内容">
        <el-input
          v-model="formInline.content"
          placeholder="请输入内容"
        ></el-input>
      </el-form-item>
      <el-form-item label="时间">
        <el-date-picker
          v-model="formInline.time"
          value-format="yyyy-MM-dd"
          type="date"
          placeholder="请选择日期"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">查询</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格区域 -->
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="title" label="标题" width="180"> </el-table-column>
      <el-table-column prop="content" label="内容" width="180">
      </el-table-column>
      <el-table-column prop="creator" label="创建员"> </el-table-column>
      <el-table-column prop="time" label="时间"> </el-table-column>
      <el-table-column fixed="right" label="操作" width="100">
        <template slot-scope="scope">
          <el-row :gutter="20">
            <el-col :span="6">
              <EditData :data="scope.row" :getList="getList"></EditData>
            </el-col>
            <el-col :span="6" :offset='4'>
              <el-button
                @click="handleRemove(scope.row)"
                type="text"
                >删除</el-button
              >
            </el-col>
          </el-row>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[10, 20, 30, 50]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total='total'
    >
    </el-pagination>
  </div>
</template>

<script>
import EditData from "./components/EditData";

export default {
  components: {
    EditData,
  },
  data() {
    return {
      formInline: {
        title: "",
        content: "",
        time: "",
      },
      pageSize: 10,
      pageNum: 1,
      total:null,
      tableData: [],

    };
  },
  created() {
    this.getList();
  },
  methods: {
    onSubmit() {
      this.getList();
    },
    async getList() {
      let { data: res } = await this.$http.post(
        `/notice/condition/${this.pageNum}/${this.pageSize}`,
        this.formInline
      );
      console.log(res);
      if (res.code == 100) {
        this.tableData = res.extend.result.list;
        this.total=res.extend.result.total;
      }
    },
    handleSizeChange(newPageSize){
      this.pageSize=newPageSize
      this.getList()
    },
    handleCurrentChange(newPageNum){
      this.pageNum=newPageNum
      this.getList()
    },
      handleRemove(data){
       this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(async() => {
          const { data: res } = await this.$http.get(`/notice/delete/${data.id}`);
          if (res.code == 500) {
            this.$message({
              type: "info",
              message: "删除失败!不允许删除！",
            });
          }else{
            this.$message({
              type: "success",
              message: "删除成功!",
            });
            this.getList();
          }
        })
     
    }
  },
};
</script>

<style>
</style>