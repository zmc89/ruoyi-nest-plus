import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { SUCCESS_CODE } from 'src/common/utils/result';
import { UserService } from '../system/user/user.service';
import { LoginlogService } from '../monitor/loginlog/loginlog.service';
import { AxiosService } from 'src/module/axios/axios.service';
import { ListToTree } from 'src/common/utils/index';
import { RegisterDto, LoginDto, ClientInfoDto } from './dto/index';
import { MenuService } from '../system/menu/menu.service';
import {ListAllSysTenantDto} from "../system/tenant/tenant/dto/tenant.dto";
import { SysTenantService } from '../system/tenant/tenant/tenant.service';
import { SysTenantEntity } from "../system/tenant/tenant/entity/tenant.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";

@Injectable()
export class MainService {
  constructor(
    @InjectRepository(SysTenantEntity)
    private readonly SysTenantRep: Repository<SysTenantEntity>,
    private readonly userService: UserService,
    private readonly loginlogService: LoginlogService,
    private readonly axiosService: AxiosService,
    private readonly menuService: MenuService,
    private readonly sysTenantService: SysTenantService,
  ) {}

  /**
   * 登陆
   * @param user
   * @returns
   */
  async login(user: LoginDto, clientInfo: ClientInfoDto) {
    // 判断租户是否存在
    const tenant = await this.SysTenantRep.findOne({
      where: {
        delFlag: '0',
        tenantCode: user.tenantCode
      }
    })
    if (tenant){
      // 如果租户存在则判断租户是否过期
      const nowDate = new Date();
      if (nowDate > new Date(tenant.expireTime)){
        return ResultData.fail(500, '租户已过期,请联系管理员续费！');
      }
      const loginLog = {
        ...clientInfo,
        userName: user.username,
        tenantName: tenant.tenantName,
        tenantCode: tenant.tenantCode,
        status: '0',
        msg: '',
      };
      try {
        const loginLocation = await this.axiosService.getIpAddress(clientInfo.ipaddr);
        loginLog.loginLocation = loginLocation;
      } catch (error) {}
      const loginRes = await this.userService.login(user, loginLog);
      loginLog.status = loginRes.code === SUCCESS_CODE ? '0' : '1';
      loginLog.msg = loginRes.msg;
      this.loginlogService.create(loginLog);
      return loginRes;
    }else {
      return ResultData.fail(500, '租户不存在');
    }
  }
  /**
   * 退出登陆
   * @param clientInfo
   */
  async logout(clientInfo: ClientInfoDto) {
    const loginLog = {
      ...clientInfo,
      userName: '',
      status: '0',
      msg: '退出成功',
    };
    try {
      const loginLocation = await this.axiosService.getIpAddress(clientInfo.ipaddr);
      loginLog.loginLocation = loginLocation;
    } catch (error) {}
    this.loginlogService.create(loginLog);
    return ResultData.ok();
  }
  /**
   * 注册
   * @param user
   * @returns
   */
  async register(user: RegisterDto) {
    return await this.userService.register(user);
  }

  /**
   * 登陆记录
   */
  loginRecord() {}

  /**
   * 获取路由菜单
   */
  async getRouters(userId: number) {
    const menus = await this.menuService.getMenuListByUserId(userId);
    return ResultData.ok(menus);
  }
  async getTenantList(query:ListAllSysTenantDto){
    return await this.sysTenantService.findAllTenant(query);
  }
}
