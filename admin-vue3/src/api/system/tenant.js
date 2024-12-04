
    import request from '@/utils/request'
    // 查询租户表列表
    export function listTenant(query) {
    return request({
        url: '/system/tenant/list',
        method: 'get',
        params: query
    })
    }
    // 查询租户表详细
    export function getTenant(tenantId) {
    return request({
        url: '/system/tenant/' + tenantId,
        method: 'get'
    })
    }

    // 新增租户表
    export function addTenant(data) {
    return request({
        url: '/system/tenant',
        method: 'post',
        data: data
    })
    }

    // 修改租户表
    export function updateTenant(data) {
    return request({
        url: '/system/tenant',
        method: 'put',
        data: data
    })
    }

    // 删除租户表
    export function delTenant(tenantId) {
    return request({
        url: '/system/tenant/' + tenantId,
        method: 'delete'
    })
    }

