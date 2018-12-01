using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SEEKPET.Info;

namespace SEEKPET.SqlDataProvider
{
    public class SqlDataProvider
    {
        #region " --------------- 数据源链接 --------------- "
        private static string strDBConnectionString = EasySite.Common.Globals.GetDBConnectionString();//"Server=(local);Database=Northwind;uid=sa;pwd=123456;"; //

        /// <summary>
        /// Constructs new SqlDataProvider instance
        /// </summary>
        public SqlDataProvider()
        {
        }
        #endregion

        #region " --------------- 常用方法 --------------- "
        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Gets the value for the field or DbNull if field has "null" value
        /// </summary>
        /// <param name="Field">The field to evaluate</param>
        /// <returns></returns>
        /// -----------------------------------------------------------------------------
        private static Object GetNull(Object Field)
        {
            return EasySite.Common.Utilities.Null.GetNull(Field, DBNull.Value);
        }
        #endregion

        #region " --------------- See_PersonInfo --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_PersonInfo GetInfoSee_PersonInfo(Int32 nSee_PersonInfoID)
        {
            return (See_PersonInfo)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_PersonInfo_GetById", nSee_PersonInfoID), typeof(See_PersonInfo));
        }

        public static See_PersonInfo GetInfoSee_PersonInfoByUserID(Int32 UserID)
        {
            return (See_PersonInfo)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_PersonInfo_GetByUserId", UserID), typeof(See_PersonInfo));
        }

        public static See_PersonInfo GetInfoSee_PersonInfoByCode(string Code)
        {
            return (See_PersonInfo)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString,CommandType.Text, "Select * From See_PersonInfo Where   Code = '"+Code+"'"), typeof(See_PersonInfo));
        }
        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_PersonInfo(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_PersonInfo" + strFilter), typeof(See_PersonInfo));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_PersonInfosReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_PersonInfo" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_PersonInfo">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_PersonInfo(See_PersonInfo objSee_PersonInfo)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_PersonInfo_Insert", GetNull(objSee_PersonInfo.UserID), objSee_PersonInfo.Name, objSee_PersonInfo.Age, objSee_PersonInfo.Sex, objSee_PersonInfo.Profession, objSee_PersonInfo.Address, objSee_PersonInfo.Code, GetNull(objSee_PersonInfo.CreateTime), objSee_PersonInfo.Par1, objSee_PersonInfo.Par2, objSee_PersonInfo.Par3, objSee_PersonInfo.Par4, objSee_PersonInfo.Par5));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_PersonInfo">实例对象</param>
        public static void UpdateSee_PersonInfo(See_PersonInfo objSee_PersonInfo)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_PersonInfo_Update", GetNull(objSee_PersonInfo.ID), GetNull(objSee_PersonInfo.UserID), objSee_PersonInfo.Name, objSee_PersonInfo.Age, objSee_PersonInfo.Sex, objSee_PersonInfo.Profession, objSee_PersonInfo.Address, objSee_PersonInfo.Code, GetNull(objSee_PersonInfo.CreateTime), objSee_PersonInfo.Par1, objSee_PersonInfo.Par2, objSee_PersonInfo.Par3, objSee_PersonInfo.Par4, objSee_PersonInfo.Par5);
        }

        public static Int32 InsertOrUpdateSee_PersonInfo(See_PersonInfo objSee_PersonInfo)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_PersonInfo_InsertOrUpdate", GetNull(objSee_PersonInfo.UserID), objSee_PersonInfo.Name, objSee_PersonInfo.Age, objSee_PersonInfo.Sex, objSee_PersonInfo.Profession, objSee_PersonInfo.Address, objSee_PersonInfo.Code, GetNull(objSee_PersonInfo.CreateTime), objSee_PersonInfo.Par1, objSee_PersonInfo.Par2, objSee_PersonInfo.Par3, objSee_PersonInfo.Par4, objSee_PersonInfo.Par5));
        }
        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_PersonInfos(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_PersonInfo_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_PersonInfoTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_PersonInfo" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_Pay --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Pay GetInfoSee_Pay(Int32 nSee_PayID)
        {
            return (See_Pay)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Pay_GetById", nSee_PayID), typeof(See_Pay));
        }

        public static See_Pay GetInfoSee_PayByTradeNo(string TradeNo)
        {
            return (See_Pay)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString,CommandType.Text,string.Format("select * from See_Pay where tradeno='{0}'",TradeNo)), typeof(See_Pay));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Pay(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Pay" + strFilter), typeof(See_Pay));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_PaysReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Pay" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Pay">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Pay(See_Pay objSee_Pay)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Pay_Insert", GetNull(objSee_Pay.UserID), objSee_Pay.UserSign, objSee_Pay.TradeNo, GetNull(objSee_Pay.HospitalID), (objSee_Pay.IsPay), GetNull(objSee_Pay.CostMoney), (objSee_Pay.CreateTime), (objSee_Pay.IsVerify), objSee_Pay.ticket, objSee_Pay.Par1, objSee_Pay.Par2, objSee_Pay.Par3));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Pay">实例对象</param>
        public static void UpdateSee_Pay(See_Pay objSee_Pay)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Pay_Update", GetNull(objSee_Pay.ID), GetNull(objSee_Pay.UserID), objSee_Pay.UserSign, objSee_Pay.TradeNo, GetNull(objSee_Pay.HospitalID), (objSee_Pay.IsPay), GetNull(objSee_Pay.CostMoney), GetNull(objSee_Pay.CreateTime), (objSee_Pay.IsVerify), objSee_Pay.ticket, objSee_Pay.Par1, objSee_Pay.Par2, objSee_Pay.Par3);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Pays(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Pay_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_PayTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Pay" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_Loss --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Loss GetInfoSee_Loss(Int32 nSee_LossID)
        {
            return (See_Loss)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Loss_GetById", nSee_LossID), typeof(See_Loss));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Loss(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Loss" + strFilter), typeof(See_Loss));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_LosssReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Loss" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Loss">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Loss(See_Loss objSee_Loss)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Loss_Insert", GetNull(objSee_Loss.UserID), GetNull(objSee_Loss.AnmialID), GetNull(objSee_Loss.LossTime), objSee_Loss.LossAddress, objSee_Loss.LossReason, objSee_Loss.LossContent, objSee_Loss.Par1, objSee_Loss.Par2, objSee_Loss.Par3));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Loss">实例对象</param>
        public static void UpdateSee_Loss(See_Loss objSee_Loss)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Loss_Update", GetNull(objSee_Loss.ID), GetNull(objSee_Loss.UserID), GetNull(objSee_Loss.AnmialID), GetNull(objSee_Loss.LossTime), objSee_Loss.LossAddress, objSee_Loss.LossReason, objSee_Loss.LossContent, objSee_Loss.Par1, objSee_Loss.Par2, objSee_Loss.Par3);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Losss(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Loss_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_LossTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Loss" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_Hospital --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Hospital GetInfoSee_Hospital(Int32 nSee_HospitalID)
        {
            return (See_Hospital)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Hospital_GetById", nSee_HospitalID), typeof(See_Hospital));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Hospital(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Hospital" + strFilter), typeof(See_Hospital));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_HospitalsReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Hospital" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Hospital">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Hospital(See_Hospital objSee_Hospital)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Hospital_Insert", objSee_Hospital.HospitalName, objSee_Hospital.Address, objSee_Hospital.CoorX, objSee_Hospital.CoorY, objSee_Hospital.Picture, objSee_Hospital.Description, objSee_Hospital.Par1, objSee_Hospital.Par2, objSee_Hospital.Par3));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Hospital">实例对象</param>
        public static void UpdateSee_Hospital(See_Hospital objSee_Hospital)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Hospital_Update", GetNull(objSee_Hospital.ID), objSee_Hospital.HospitalName, objSee_Hospital.Address, objSee_Hospital.CoorX, objSee_Hospital.CoorY, objSee_Hospital.Picture, objSee_Hospital.Description, objSee_Hospital.Par1, objSee_Hospital.Par2, objSee_Hospital.Par3);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Hospitals(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Hospital_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_HospitalTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Hospital" + strFilter).Tables[0];
        }

        public static Int32 GetSee_HospitalCount(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, CommandType.Text, "SELECT COUNT(1) FROM See_Hospital" + strFilter));
        }
        #endregion

        #region " --------------- See_Help --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Help GetInfoSee_Help(Int32 nSee_HelpID)
        {
            return (See_Help)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Help_GetById", nSee_HelpID), typeof(See_Help));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Help(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Help" + strFilter), typeof(See_Help));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_HelpsReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Help" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Help">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Help(See_Help objSee_Help)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Help_Insert", objSee_Help.Feature, objSee_Help.Address, objSee_Help.Pay, objSee_Help.Description, objSee_Help.Picture, GetNull(objSee_Help.CreateTime), objSee_Help.Par1, objSee_Help.Par2, objSee_Help.Par3, objSee_Help.Par4, objSee_Help.Par5));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Help">实例对象</param>
        public static void UpdateSee_Help(See_Help objSee_Help)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Help_Update", GetNull(objSee_Help.ID), objSee_Help.Feature, objSee_Help.Address, objSee_Help.Pay, objSee_Help.Description, objSee_Help.Picture, GetNull(objSee_Help.CreateTime), objSee_Help.Par1, objSee_Help.Par2, objSee_Help.Par3, objSee_Help.Par4, objSee_Help.Par5);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Helps(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Help_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_HelpTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Help" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_AnimalInfo --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_AnimalInfo GetInfoSee_AnimalInfo(Int32 nSee_AnimalInfoID)
        {
            return (See_AnimalInfo)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_AnimalInfo_GetById", nSee_AnimalInfoID), typeof(See_AnimalInfo));
        }

        public static See_AnimalInfo GetInfoSee_AnimalInfoByUserID(Int32 UserID)
        {
            return (See_AnimalInfo)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString,CommandType.Text,"select * from See_AnimalInfo where UserID="+UserID), typeof(See_AnimalInfo));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_AnimalInfo(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_AnimalInfo" + strFilter), typeof(See_AnimalInfo));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_AnimalInfosReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_AnimalInfo" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_AnimalInfo">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_AnimalInfo(See_AnimalInfo objSee_AnimalInfo)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_AnimalInfo_Insert", GetNull(objSee_AnimalInfo.UserID), objSee_AnimalInfo.No, objSee_AnimalInfo.Name, objSee_AnimalInfo.Sex, objSee_AnimalInfo.Kind, objSee_AnimalInfo.Age, objSee_AnimalInfo.Color, objSee_AnimalInfo.Description, GetNull(objSee_AnimalInfo.IsImmune), objSee_AnimalInfo.Picture, GetNull(objSee_AnimalInfo.CreateTime), objSee_AnimalInfo.Par1, objSee_AnimalInfo.Par2, objSee_AnimalInfo.Par3, objSee_AnimalInfo.Par4, objSee_AnimalInfo.Par5));
        }

        public static Int32 InsertOrUpdateSee_AnimalInfo(See_AnimalInfo objSee_AnimalInfo)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_AnimalInfo_InsertOrUpdate", GetNull(objSee_AnimalInfo.UserID), objSee_AnimalInfo.No, objSee_AnimalInfo.Name, objSee_AnimalInfo.Sex, objSee_AnimalInfo.Kind, objSee_AnimalInfo.Age, objSee_AnimalInfo.Color, objSee_AnimalInfo.Description, GetNull(objSee_AnimalInfo.IsImmune), objSee_AnimalInfo.Picture, GetNull(objSee_AnimalInfo.CreateTime), objSee_AnimalInfo.Par1, objSee_AnimalInfo.Par2, objSee_AnimalInfo.Par3, objSee_AnimalInfo.Par4, objSee_AnimalInfo.Par5));
        }
        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_AnimalInfo">实例对象</param>
        public static void UpdateSee_AnimalInfo(See_AnimalInfo objSee_AnimalInfo)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_AnimalInfo_Update", GetNull(objSee_AnimalInfo.ID), GetNull(objSee_AnimalInfo.UserID), objSee_AnimalInfo.No, objSee_AnimalInfo.Name, objSee_AnimalInfo.Sex, objSee_AnimalInfo.Kind, objSee_AnimalInfo.Age, objSee_AnimalInfo.Color, objSee_AnimalInfo.Description, GetNull(objSee_AnimalInfo.IsImmune), objSee_AnimalInfo.Picture, GetNull(objSee_AnimalInfo.CreateTime), objSee_AnimalInfo.Par1, objSee_AnimalInfo.Par2, objSee_AnimalInfo.Par3, objSee_AnimalInfo.Par4, objSee_AnimalInfo.Par5);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_AnimalInfos(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_AnimalInfo_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_AnimalInfoTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_AnimalInfo" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_User --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_User GetInfoSee_User(Int32 nSee_UserID)
        {
            return (See_User)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_User_GetById", nSee_UserID), typeof(See_User));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_User(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_User" + strFilter), typeof(See_User));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_UsersReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_User" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_User">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_User(See_User objSee_User)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_User_Insert", GetNull(objSee_User.UserID), objSee_User.OpenID, objSee_User.AccessToken, GetNull(objSee_User.CreateTime), objSee_User.LoginType, objSee_User.Par1));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_User">实例对象</param>
        public static void UpdateSee_User(See_User objSee_User)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_User_Update", GetNull(objSee_User.ID), GetNull(objSee_User.UserID), objSee_User.OpenID, objSee_User.AccessToken, GetNull(objSee_User.CreateTime), objSee_User.LoginType, objSee_User.Par1);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Users(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_User_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_UserTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_User" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_Code --------------- "
        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Code GetInfoSee_Code(Int32 nSee_CodeID)
        {
            return (See_Code)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Code_GetById", nSee_CodeID), typeof(See_Code));
        }
        public static See_Code GetInfoSee_CodeByCode(string Code)
        {
            return (See_Code)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "select * from See_Code where code='"+Code+"'"), typeof(See_Code));
        }

        public static void UpdateSee_CodeInfoByCode(int UserID, string Code)
        {
            string sql = string.Format("update See_Code set UserID={0} where code='{1}'", UserID, Code);
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, CommandType.Text, sql);
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Code(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Code" + strFilter), typeof(See_Code));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_CodesReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Code" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Code">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Code(See_Code objSee_Code)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Code_Insert", objSee_Code.Code, GetNull(objSee_Code.UserID), GetNull(objSee_Code.HospitalID),objSee_Code.IsUse, objSee_Code.Par1, objSee_Code.Par2));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Code">实例对象</param>
        public static void UpdateSee_Code(See_Code objSee_Code)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Code_Update", GetNull(objSee_Code.ID), objSee_Code.Code, GetNull(objSee_Code.UserID), GetNull(objSee_Code.HospitalID), objSee_Code.IsUse, objSee_Code.Par1, objSee_Code.Par2);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Codes(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Code_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_CodeTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Code" + strFilter).Tables[0];
        }
        #endregion

        #region " --------------- See_Seek --------------- "

        /// <summary>
        /// 获取数据信息 单条
        /// </summary>
        /// <param name="nID">主键ID</param>
        /// <returns>返回主键ID查询记录，若无相关记录则返回null</returns>
        public static See_Seek GetInfoSee_Seek(Int32 nSee_SeekID)
        {
            return (See_Seek)EasySite.Common.Utilities.CBO.FillObject(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, "See_Seek_GetById", nSee_SeekID), typeof(See_Seek));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，实例化对象数组</returns>
        public static System.Collections.ArrayList GetListSee_Seek(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return EasySite.Common.Utilities.CBO.FillCollection(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Seek" + strFilter), typeof(See_Seek));
        }

        /// <summary>
        /// 获取信息列表 查询语句
        /// </summary>
        /// <param name="strConditions">查询条件</param>
        /// <returns>返回符合条件信息列表，IDataReader</returns>
        public static IDataReader GetListSee_SeeksReader(String strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteReader(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Seek" + strFilter);
        }

        /// <summary>
        /// 插入一条实例信息
        /// </summary>
        /// <param name="objSee_Seek">实例对象</param>
        /// <returns>返回主键ID</returns>
        public static Int32 InsertSee_Seek(See_Seek objSee_Seek)
        {
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, "See_Seek_Insert", objSee_Seek.Kind, objSee_Seek.Feature, objSee_Seek.LossPlace, objSee_Seek.Pay, objSee_Seek.Contract, objSee_Seek.XinNo, objSee_Seek.City, GetNull(objSee_Seek.CreateTime), objSee_Seek.Par1, objSee_Seek.Par2));
        }

        /// <summary>
        /// 更新一条信息
        /// </summary>
        /// <param name="objSee_Seek">实例对象</param>
        public static void UpdateSee_Seek(See_Seek objSee_Seek)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Seek_Update", GetNull(objSee_Seek.ID), objSee_Seek.Kind, objSee_Seek.Feature, objSee_Seek.LossPlace, objSee_Seek.Pay, objSee_Seek.Contract, objSee_Seek.XinNo, objSee_Seek.City, GetNull(objSee_Seek.CreateTime), objSee_Seek.Par1, objSee_Seek.Par2);
        }

        /// <summary>
        /// 删除多条信息
        /// </summary>
        /// <param name="strIDs">主键ID，采用逗号分隔（1,2,3）</param>
        public static void DeleteSee_Seeks(string strIDs)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, "See_Seek_Del", strIDs);
        }

        /// <summary>
        /// 获取查询条件表
        /// </summary>
        /// <param name="strConditions"></param>
        /// <returns>全部结果集</returns>
        public static DataTable GetSee_SeekTable(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, "SELECT * FROM See_Seek" + strFilter).Tables[0];
        }

        public static Int32 GetSee_SeekCount(string strConditions)
        {
            string strFilter = "";
            if (strConditions != null && strConditions != String.Empty) strFilter = "  WHERE " + strConditions;
            return Convert.ToInt32(Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, CommandType.Text, "SELECT COUNT(1) FROM See_Seek" + strFilter));
        }
        #endregion

        public static int GetTableInfoCount(string strsql)
        {
            object result= Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, CommandType.Text, strsql);
            if (result != null && result.ToString() != "")
            {
                return int.Parse(result.ToString());
            }
            else
            {
                return 0;
            }
        }

        public static string GetSQLValue(string strsql)
        {
            object result = Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteScalar(strDBConnectionString, CommandType.Text, strsql);
            if (result != null && result.ToString() != "")
            {
                return result.ToString();
            }
            else
            {
                return "";
            }
        }

        public static void ExecSQL(string strsql)
        {
            Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteNonQuery(strDBConnectionString, CommandType.Text, strsql);
        }

        public static DataTable GetSQLTable(string strsql)
        {
            DataTable result = Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(strDBConnectionString, CommandType.Text, strsql).Tables[0];
            return result;
        }
    }
}