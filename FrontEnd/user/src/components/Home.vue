<template>
  <el-container class="home-container">
    <!-- 头部区域 -->
    <el-header>
      <div>
        <img src="../assets/meeting.png" alt />
        <span>会议室预约系统</span>
      </div>
      <el-button type="info" @click="logout">退出</el-button>
    </el-header>
    <!-- 页面主体区域 -->
    <el-container>
      <!-- 侧边栏 -->
      <el-aside :width="isCollapse ? '64px' : '200px'">
        <div class="toggle-button" @click="toggleCollapse">|||</div>
        <!-- 侧边栏菜单区域 -->
        <el-menu
          :default-active="activePath"
          :router="true"
          :collapse-transition="false"
          :collapse="isCollapse"
          :unique-opened="true"
          background-color="#333744"
          text-color="#fff"
          active-text-color="#409eff"
        >
          <!-- 一级菜单 -->
          <el-submenu
            :index="item.id + ''"
            v-for="item in menulist"
            :key="item.id"
          >
            <!-- 一级菜单的模板 -->
            <template slot="title">
              <!-- 图标 -->
              <i :class="iconsObj[item.id]"></i>
              <!-- 文本 -->
              <span>{{ item.authName }}</span>
            </template>
            <!-- 二级菜单 -->
            <el-menu-item
              @click="saveNavState('/' + subItem.path)"
              :index="'/' + subItem.path"
              v-for="subItem in item.children"
              :key="subItem.id"
            >
              <template slot="title">
                <!-- 图标 -->
                <i :class="iconsObj[subItem.id]"></i>
                <!-- 文本 -->
                <span>{{ subItem.authName }}</span>
              </template>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
      <!-- 右侧内容 -->
      <el-main>
        <!-- 路由占位符 -->
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      // 左侧菜单数据
      menulist: [
        {
          id: 101,
          authName: "申请会议室",
          path: "null",
          children: [
            { id: 1011, authName: "进行预约", path: "book" },
            { id: 1012, authName: "取消预约", path: "cancelBook" },
          ],
        },
        {
          id: 102,
          authName: "预约进程/历史",
          path: "null",
          children: [
            { id: 1021, authName: "已通过", path: "approved" },
            { id: 1022, authName: "未通过", path: "notApproved" },
            { id: 1023, authName: "审核中", path: "approving" },
            { id: 1024, authName: "查看历史会议", path: "history" },
          ],
        },
        // {
        //   id: 103,
        //   authName: "会议进程",
        //   path: "null",
        //   children: [
        //     { id: 1032, authName: "请假列表", path: "leave" },
        //   ],
        // },
        {
          id: 103,
          authName: "公告管理模块",
          path: "null",
          children: [
            { id: 1031, authName: "发布公告", path: "noticeMade" },
            { id: 1032, authName: "收到的公告", path: "noticeReceive" },
            { id: 1033, authName: "发布的公告", path: "noticePub" },
          ],
        },
        {
          id: 104,
          authName: "成员模块",
          path: "null",
          children: [
            { id: 1041, authName: "查看成员", path: "member" },
            { id: 1042, authName: "添加成员", path: "memberAdd" },
            { id: 1043, authName: "部门信息", path: "department" },
          ],
        },
      ],
      iconsObj: {
        101: "iconfont icon-baobiao",
        102: "iconfont icon-users",
        103: "el-icon-s-comment",
        104: "el-icon-user-solid",
        105: "iconfont icon-users",
        1011: "el-icon-circle-plus",
        1012: "el-icon-error",
        1021: "el-icon-folder-checked",
        1022: "el-icon-folder-opened",
        1023: "el-icon-loading",
        1024: "el-icon-document-copy",
        1031: "el-icon-thumb",
        1032: "el-icon-chat-round",
        1033: "el-icon-chat-line-round",
        1041: "el-icon-folder-checked",
        1042: "el-icon-circle-plus",
        1043: "el-icon-s-check",
      },
      isCollapse: false,
      activePath: "",
      notify: null,
    };
  },
  created() {
    this.activePath = window.sessionStorage.getItem("activePath");
    this.getNotice();
  },
  mounted() {},
  methods: {
    async getNotice() {
      let { data: res } = await this.$http.post(
        "/notice/selectNoticeByLeader/1/100",
        {}
      );
      console.log(res);
      let list = res.extend.result.list;
      let content = list[list.length - 1].content;
      let time = list[list.length - 1].time;
      let creator = list[list.length - 1].creator;
      this.notify = this.$notify({
        title: list[list.length - 1].title,
        dangerouslyUseHTMLString: true,
        message: `
      <div>
      <p>发布日期：${time}</p>
      <p>发布人：${creator}</p>
      <strong>${content}</strong>
      <a herf='javaScript:;' style="position:absolute;right:10px;">查看更多</a>
      </div>`,
        duration: 0,
        onClick: () => {
          this.$router.push("/noticeReceive");
        },
      });
    },
    logout() {
      this.notify.close();
      window.sessionStorage.clear();
      this.$router.push("/login");
    },
    // 点击按钮,切换菜单的折叠与展开
    toggleCollapse() {
      this.isCollapse = !this.isCollapse;
    },
    // 保存链接的激活状态
    saveNavState(activePath) {
      window.sessionStorage.setItem("activePath", activePath);
      this.activePath = activePath;
    },
  },
};
</script>

<style lang="less" scoped>
.home-container {
  height: 100%;
}

.el-header {
  background-color: #373d41;
  display: flex;
  justify-content: space-between;
  padding-left: 0;
  align-items: center;
  color: #fff;
  font-size: 20px;
  > div {
    display: flex;
    align-items: center;
    height: 100%;
    img {
      height: 100%;
    }
    span {
      margin-left: 15px;
    }
  }
}

.el-menu {
  border-right: 0;
}

.el-aside {
  background-color: #333744;

  .toggle-button {
    background-color: #4a5064;
    cursor: pointer;
    color: #fff;
    font-size: 10px;
    line-height: 24px;
    text-align: center;
    letter-spacing: 0.2em;
  }

  .el-main {
    border-right: 0;
  }
}

.iconfont {
  margin-right: 10px;
}
</style>
