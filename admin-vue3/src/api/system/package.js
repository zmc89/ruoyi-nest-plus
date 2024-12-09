
    import request from '@/utils/request'
    // 查询租户套餐表列表
    export function listpackage(query) {
    return request({
        url: '/system/tenant/package/list',
        method: 'get',
        params: query
    })
    }
    // 查询租户套餐表详细
    export function getpackage(packageId) {
    return request({
        url: '/system/tenant/package/' + packageId,
        method: 'get'
    })
    }

    // 新增租户套餐表
    export function addpackage(data) {
    return request({
        url: '/system/tenant/package',
        method: 'post',
        data: data
    })
    }

    // 修改租户套餐表
    export function updatepackage(data) {
    return request({
        url: '/system/tenant/package',
        method: 'put',
        data: data
    })
    }

    // 删除租户套餐表
    export function delpackage(packageId) {
    return request({
        url: '/system/tenant/package/' + packageId,
        method: 'delete'
    })
    }

    export function getTenantPackageMenu(packageId){
    return request({
        url: `/system/menu/packageMenuTreeselect/${packageId}`,
        method: 'get'
    })
    }

    export function changePackageStatus(data){
    return request({
        url: '/system/tenant/package/changePackageStatus',
        method: 'put',
        data: data
    })
    }

