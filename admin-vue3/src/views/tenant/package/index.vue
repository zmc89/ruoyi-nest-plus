<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="套餐名称" prop="packageName">
        <el-input
          v-model="queryParams.packageName"
          placeholder="请输入套餐名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['system:tenantPackage:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:tenantPackage:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:tenantPackage:remove']"
        >删除
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="套餐名称" align="center" prop="packageName" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template v-slot="{row}">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(row)" v-hasPermi="['system:tenantPackage:edit']">
            修改
          </el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(row)"
                     v-hasPermi="['system:tenantPackage:remove']">删除
          </el-button>
        </template>
      </el-table-column>

    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
  <index-dialog ref="indexDialogRef" @update="updateHandler"></index-dialog>
</template>


<script setup name="package">
import { listpackage, getpackage, delpackage, addpackage, updatepackage,getTenantPackageMenu } from '@/api/system/package'
import { getCurrentInstance, ref } from 'vue'
import indexDialog from './components/indexDialog.vue'
import { parseTime } from '../../../utils/ruoyi'
import { changeUserStatus } from '@/api/system/user'

const { proxy } = getCurrentInstance()

const showSearch = ref(true)
const single = ref(true);
const multiple = ref(true);
const queryParams = ref({
  packageName: null,
  pageNum: 1,
  pageSize: 10
})
const loading = ref(true)
const total = ref(0)
const dataList = ref([])
const indexDialogRef = ref(null)
const queryRef = ref(null)


const handleSelectionChange = (selection)=>{
  ids.value = selection.map(item => item.packageId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

const handleQuery = () => {
  queryParams.value.pageNum = 1
  getList()
}
const getList = () => {
  loading.value = true
  listpackage(queryParams.value).then((res) => {
    dataList.value = res.data?.list || []
    total.value = res.data?.total || 0
    loading.value = false
  })
}
const resetQuery = () => {
  proxy.resetForm('queryRef')
  handleQuery()
}
const handleUpdate = (row) => {
  indexDialogRef.value.openDialog(row)
}
const handleAdd = () => {
  indexDialogRef.value.openDialog()
}

const handleStatusChange = (row)=> {

}
const handleDelete = (row) => {
  proxy.$modal
    .confirm('是否确认删除编号为"' + row.packageId + '"的数据项?')
    .then(function() {
      return delpackage(row.packageId)
    })
    .then(() => {
      getList()
      proxy.$modal.msgSuccess('删除成功')
    })
    .catch(() => {
    })
}
const updateHandler = () => {
  handleQuery()
}
getList()
</script>


