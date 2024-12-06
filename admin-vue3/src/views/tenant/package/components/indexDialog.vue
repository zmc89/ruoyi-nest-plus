<template>
  <el-dialog v-model="dialogVisible" :title="dialogTitle" width="500">
    <el-form :model="form" label-width="auto" style="max-width: 600px" ref="formRef" :rules="rules">
      <el-form-item label="套餐名称" prop="packageName">
        <el-input v-model="form.packageName" placeholder="请输入套餐名称" />
      </el-form-item>
      <el-form-item label="关联菜单">
        <el-checkbox v-model="menuExpand" @change="handleCheckedTreeExpand($event, 'menu')">展开/折叠</el-checkbox>
        <el-checkbox v-model="menuNodeAll" @change="handleCheckedTreeNodeAll($event, 'menu')">全选/全不选</el-checkbox>
        <el-checkbox v-model="form.menuCheckStrictly" @change="handleCheckedTreeConnect($event, 'menu')">父子联动</el-checkbox>
        <el-tree
          class="tree-border"
          :data="menuOptions"
          show-checkbox
          ref="menuTreeRef"
          node-key="id"
          :check-strictly="!form.menuCheckStrictly"
          empty-text="加载中，请稍候"
          :props="{ label: 'label', children: 'children' }"
        />
      </el-form-item>
      <el-form-item label="备注" prop="remark">
        <el-input v-model="form.remark" placeholder="请输入备注" />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="cancel" class="defauleButton">取消</el-button>
        <el-button type="primary" @click="confirm"> 确定</el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script setup>
import { addpackage, getTenantPackageMenu, updatepackage } from '@/api/system/package'
import { ref, getCurrentInstance } from 'vue'
import { treeselect as menuTreeselect } from '@/api/system/menu'
const { proxy } = getCurrentInstance()

const dialogVisible = ref(false)
const dialogTitle = ref('')
const formRef = ref(null)
const menuExpand = ref(false);
const menuNodeAll = ref(false);
const menuOptions = ref([]);
const menuTreeRef = ref(null)
const emit = defineEmits(['update'])
const form = ref({
  packageName: '',
  menuIds: '',
  menuCheckStrictly:true,
  remark: ''
})
const rules = ref({
  packageName: [{ required: true, message: '套餐名称不能为空', trigger: 'blur' }],
  menuIds: [{ required: true, message: '关联菜单不能为空', trigger: 'blur' }]
})
// 树权限（展开/折叠）
const handleCheckedTreeExpand = (value, type) => {
  if (type == 'menu') {
    let treeList = menuOptions.value;
    for (let i = 0; i < treeList.length; i++) {
      if (menuTreeRef.value) {
        menuTreeRef.value.store.nodesMap[treeList[i].id].expanded = value;
      }
    }
  }
};

/** 获取菜单下拉树结构 */
const  getMenuTreeselect = ()=> {
  menuTreeselect().then((response) => {
    menuOptions.value = response.data
  })
}

// 树权限（全选/全不选）
const handleCheckedTreeNodeAll = (value, type) => {
  if (type == 'menu') {
    menuTreeRef.value?.setCheckedNodes(value ?menuOptions.value: []);
  }
};

// 树权限（父子联动）
const handleCheckedTreeConnect = (value,type) => {
  if (type == 'menu') {
    form.value.menuCheckStrictly = value;
  }
};

/** 所有菜单节点数据 */
 const getMenuAllCheckedKeys = ()=> {
  // 目前被选中的菜单节点
  let checkedKeys = menuTreeRef.value.getCheckedKeys()
  // 半选中的菜单节点
  let halfCheckedKeys = menuTreeRef.value.getHalfCheckedKeys()
  checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys)
  return checkedKeys
}

const cancel = () => close()
const confirm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      const action = form.value.packageId ? updatepackage : addpackage
      form.value.menuCheckStrictly = form.value.menuCheckStrictly ? 1 : 0;
      form.value.menuIds = getMenuAllCheckedKeys()
      form.value.menuIds = JSON.stringify(form.value.menuIds)
      action(form.value).then(() => {
        proxy.$modal.msgSuccess('操作成功')
        emit('update')
        close()
      })
    }
  })
}
const close = () => dialogVisible.value = false
const reset = () => {
  form.value = {
    packageName: '',
    menuIds: '',
    menuCheckStrictly:true,
    remark: ''
  }
  proxy.resetForm('formRef')
}
const init = (row) => {
  reset()
  if(row){
    const packageMenu = getTenantPackageMenu(row.packageId)
    console.log('packageMenu',packageMenu)
  }
  dialogTitle.value = row ? '修改租户套餐表' : '新增租户套餐表'
  form.value = row ? { ...row } : {}
  getMenuTreeselect()
}
const openDialog = (row = null) => {
  dialogVisible.value = true
  init(row)
}
defineExpose({ openDialog })
</script>

