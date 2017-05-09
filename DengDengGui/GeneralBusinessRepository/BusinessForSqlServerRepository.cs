﻿using GeneralBusinessData;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace GeneralBusinessRepository
{
    /// <summary>
    /// 通用业务平台仓储处理类（For MS SqlServer)
    /// </summary>
    public class BusinessForSqlServerRepository : IBusinessRepository
    {
        /// <summary>
        /// 数据库操作类
        /// </summary>
        ISqlHelper _sqlHelper;
        /// <summary>
        /// 实例化sqlserver的仓储对象
        /// </summary>
        /// <param name="sqlHelper"></param>
        public BusinessForSqlServerRepository(ISqlHelper sqlHelper)
        {
            _sqlHelper = sqlHelper;
        }

        #region 用户管理
        /// <summary>
        /// 查询全部用户
        /// </summary>
        /// <returns></returns>
        public List<Dictionary<string, dynamic>> GetUsers()
        {
            var sql = "select * from users";
            return _sqlHelper.QueryList(sql);
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public int AddUser(string userName, string password)
        {
            var sql = $@"insert into users(username,password) values(@username,@password)";
            var userNameParameter = new SqlParameter() { Value = userName, ParameterName = "@username" };
            var passwordParameter = new SqlParameter() { Value = password, ParameterName = "@password" };
            return _sqlHelper.ChangeData(sql, userNameParameter, passwordParameter);
        }

        /// <summary>
        /// 修改用户
        /// </summary>
        /// <param name="id">编号</param>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public int ModifyUser(int id, string userName, string password)
        {
            var sql = $@"update  users set username=@username,password) =@password where id=@id";
            var userNameParameter = new SqlParameter() { Value = userName, ParameterName = "@username" };
            var passwordParameter = new SqlParameter() { Value = password, ParameterName = "@password" };
            var idParameter = new SqlParameter() { Value = id, ParameterName = "@id" };
            return _sqlHelper.ChangeData(sql, userNameParameter, passwordParameter, idParameter);
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns></returns>
        public int RemoveUser(int id)
        {
            var sql = $@"delete  users s where id=@id";
            var idParameter = new SqlParameter() { Value = id, ParameterName = "@id" };
            return _sqlHelper.ChangeData(sql, idParameter);
        }
        #endregion
    }
}
