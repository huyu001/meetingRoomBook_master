<template>
    <div>
        <el-table
      :data="tableData"
      stripe
      style="width: 100%">
      <el-table-column
        prop="date"
        label="日期"
        width="180">
      </el-table-column>
      <el-table-column
        prop="name"
        label="姓名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="address"
        label="原因"
        width:='180'>
      </el-table-column>
      <el-table-column
        label="状态"
        width:='180'>
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <span size="medium">{{ scope.row.status?'同意':'拒绝' }}</span>
          </div>
      </template>
      </el-table-column>
      <el-table-column
        label="操作">
        <template slot-scope="scope">
            <el-button type="primary" size="small" @click="agree(scope.row)">同意</el-button>
            <el-button type="danger" size="small" @click="refuse(scope.row)">拒绝</el-button>
        </template>
        
      </el-table-column>
    </el-table>
    </div>
  </template>

  <script>
export default {
  data() {
    return {
      dialogVisible: false,
      status: null,
      tableData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
          status: 1,
        },
        {
          date: "2016-05-04",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1517 弄",
          staus: 0,
        },
        {
          date: "2016-05-01",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1519 弄",
          status: 1,
        },
        {
          date: "2016-05-03",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1516 弄",
          status: 1,
        },
      ],
    };
  },
  methods: {
    agree(value) {
        console.log(value)
      this.$confirm("此操作将同意该成员的请假, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "操作成功!",
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消该操作",
          });
        });
    },
    refuse(value) {
      this.$confirm("此操作将拒绝该成员的请假, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "操作成功!",
          });
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