using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEEKPET.Info
{

    /// <summary>
    /// 实体类See_AnimalInfo。(属性说明自动提取数据库字段的描述信息)2017/11/29 17:38:38
    /// </summary>
    public class See_AnimalInfo
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private Int32 _UserID;
        private string _No;
        private string _Name;
        private string _Sex;
        private string _Kind;
        private string _Age;
        private string _Color;
        private string _Description;
        private Boolean _IsImmune;
        private string _Picture;
        private DateTime _CreateTime;
        private string _Par1;
        private string _Par2;
        private string _Par3;
        private string _Par4;
        private string _Par5;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public string No
        {
            get
            {
                return _No;
            }
            set
            {
                _No = value;
            }
        }

        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                _Name = value;
            }
        }

        public string Sex
        {
            get
            {
                return _Sex;
            }
            set
            {
                _Sex = value;
            }
        }

        public string Kind
        {
            get
            {
                return _Kind;
            }
            set
            {
                _Kind = value;
            }
        }

        public string Age
        {
            get
            {
                return _Age;
            }
            set
            {
                _Age = value;
            }
        }

        public string Color
        {
            get
            {
                return _Color;
            }
            set
            {
                _Color = value;
            }
        }

        public string Description
        {
            get
            {
                return _Description;
            }
            set
            {
                _Description = value;
            }
        }

        public Boolean IsImmune
        {
            get
            {
                return _IsImmune;
            }
            set
            {
                _IsImmune = value;
            }
        }

        public string Picture
        {
            get
            {
                return _Picture;
            }
            set
            {
                _Picture = value;
            }
        }

        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }

        public string Par4
        {
            get
            {
                return _Par4;
            }
            set
            {
                _Par4 = value;
            }
        }

        public string Par5
        {
            get
            {
                return _Par5;
            }
            set
            {
                _Par5 = value;
            }
        }


        #endregion
    }


    /// <summary>
    /// 实体类See_Help。(属性说明自动提取数据库字段的描述信息)2017/12/5 17:25:44
    /// </summary>
    public class See_Help
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private string _Feature;
        private string _Address;
        private string _Pay;
        private string _Description;
        private string _Picture;
        private DateTime _CreateTime;
        private string _Par1;
        private string _Par2;
        private string _Par3;
        private string _Par4;
        private string _Par5;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public string Feature
        {
            get
            {
                return _Feature;
            }
            set
            {
                _Feature = value;
            }
        }

        public string Address
        {
            get
            {
                return _Address;
            }
            set
            {
                _Address = value;
            }
        }

        public string Pay
        {
            get
            {
                return _Pay;
            }
            set
            {
                _Pay = value;
            }
        }

        public string Description
        {
            get
            {
                return _Description;
            }
            set
            {
                _Description = value;
            }
        }

        public string Picture
        {
            get
            {
                return _Picture;
            }
            set
            {
                _Picture = value;
            }
        }

        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }

        public string Par4
        {
            get
            {
                return _Par4;
            }
            set
            {
                _Par4 = value;
            }
        }

        public string Par5
        {
            get
            {
                return _Par5;
            }
            set
            {
                _Par5 = value;
            }
        }


        #endregion
    }


    /// <summary>
    /// 实体类See_Hospital。(属性说明自动提取数据库字段的描述信息)2017/11/29 17:39:11
    /// </summary>
    public class See_Hospital
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private string _HospitalName;
        private string _Address;
        private string _CoorX;
        private string _CoorY;
        private string _Picture;
        private string _Description;
        private string _Par1;
        private string _Par2;
        private string _Par3;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public string HospitalName
        {
            get
            {
                return _HospitalName;
            }
            set
            {
                _HospitalName = value;
            }
        }

        public string Address
        {
            get
            {
                return _Address;
            }
            set
            {
                _Address = value;
            }
        }

        public string CoorX
        {
            get
            {
                return _CoorX;
            }
            set
            {
                _CoorX = value;
            }
        }

        public string CoorY
        {
            get
            {
                return _CoorY;
            }
            set
            {
                _CoorY = value;
            }
        }

        public string Picture
        {
            get
            {
                return _Picture;
            }
            set
            {
                _Picture = value;
            }
        }

        public string Description
        {
            get
            {
                return _Description;
            }
            set
            {
                _Description = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }


        #endregion
    }

    /// <summary>
    /// 实体类See_Loss。(属性说明自动提取数据库字段的描述信息)2017/11/29 17:39:27
    /// </summary>
    public class See_Loss
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private Int32 _UserID;
        private Int32 _AnmialID;
        private DateTime _LossTime;
        private string _LossAddress;
        private string _LossReason;
        private string _LossContent;
        private string _Par1;
        private string _Par2;
        private string _Par3;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public Int32 AnmialID
        {
            get
            {
                return _AnmialID;
            }
            set
            {
                _AnmialID = value;
            }
        }

        public DateTime LossTime
        {
            get
            {
                return _LossTime;
            }
            set
            {
                _LossTime = value;
            }
        }

        public string LossAddress
        {
            get
            {
                return _LossAddress;
            }
            set
            {
                _LossAddress = value;
            }
        }

        public string LossReason
        {
            get
            {
                return _LossReason;
            }
            set
            {
                _LossReason = value;
            }
        }

        public string LossContent
        {
            get
            {
                return _LossContent;
            }
            set
            {
                _LossContent = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }


        #endregion
    }



    /// <summary>
    /// 实体类See_Pay。(属性说明自动提取数据库字段的描述信息)2017/12/12 15:57:28
    /// </summary>
    public class See_Pay
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private Int32 _UserID;
        private string _UserSign;
        private string _TradeNo;
        private Int32 _HospitalID;
        private Boolean _IsPay;
        private Int32 _CostMoney;
        private DateTime _CreateTime;
        private Boolean _IsVerify;
        private string _ticket;
        private string _Par1;
        private string _Par2;
        private string _Par3;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public string UserSign
        {
            get
            {
                return _UserSign;
            }
            set
            {
                _UserSign = value;
            }
        }

        public string TradeNo
        {
            get
            {
                return _TradeNo;
            }
            set
            {
                _TradeNo = value;
            }
        }

        public Int32 HospitalID
        {
            get
            {
                return _HospitalID;
            }
            set
            {
                _HospitalID = value;
            }
        }

        public Boolean IsPay
        {
            get
            {
                return _IsPay;
            }
            set
            {
                _IsPay = value;
            }
        }

        public Int32 CostMoney
        {
            get
            {
                return _CostMoney;
            }
            set
            {
                _CostMoney = value;
            }
        }

        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }

        public Boolean IsVerify
        {
            get
            {
                return _IsVerify;
            }
            set
            {
                _IsVerify = value;
            }
        }

        public string ticket
        {
            get
            {
                return _ticket;
            }
            set
            {
                _ticket = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }


        #endregion
    }




    /// <summary>
    /// 实体类See_PersonInfo。(属性说明自动提取数据库字段的描述信息)2017/11/29 17:39:53
    /// </summary>
    public class See_PersonInfo
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private Int32 _UserID;
        private string _Name;
        private string _Age;
        private string _Sex;
        private string _Profession;
        private string _Address;
        private string _Code;
        private DateTime _CreateTime;
        private string _Par1;
        private string _Par2;
        private string _Par3;
        private string _Par4;
        private string _Par5;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                _Name = value;
            }
        }

        public string Age
        {
            get
            {
                return _Age;
            }
            set
            {
                _Age = value;
            }
        }

        public string Sex
        {
            get
            {
                return _Sex;
            }
            set
            {
                _Sex = value;
            }
        }

        public string Profession
        {
            get
            {
                return _Profession;
            }
            set
            {
                _Profession = value;
            }
        }

        public string Address
        {
            get
            {
                return _Address;
            }
            set
            {
                _Address = value;
            }
        }

        public string Code
        {
            get
            {
                return _Code;
            }
            set
            {
                _Code = value;
            }
        }

        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }

        public string Par3
        {
            get
            {
                return _Par3;
            }
            set
            {
                _Par3 = value;
            }
        }

        public string Par4
        {
            get
            {
                return _Par4;
            }
            set
            {
                _Par4 = value;
            }
        }

        public string Par5
        {
            get
            {
                return _Par5;
            }
            set
            {
                _Par5 = value;
            }
        }


        #endregion
    }

    /// <summary>
    /// 实体类See_User。(属性说明自动提取数据库字段的描述信息)2017/12/2 13:57:45
    /// </summary>
    public class See_User
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private Int32 _UserID;
        private string _OpenID;
        private string _AccessToken;
        private DateTime _CreateTime;
        private string _LoginType;
        private string _Par1;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public string OpenID
        {
            get
            {
                return _OpenID;
            }
            set
            {
                _OpenID = value;
            }
        }

        public string AccessToken
        {
            get
            {
                return _AccessToken;
            }
            set
            {
                _AccessToken = value;
            }
        }

        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }

        public string LoginType
        {
            get
            {
                return _LoginType;
            }
            set
            {
                _LoginType = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }


        #endregion
    }

    /// <summary>
    /// 实体类See_Code。(属性说明自动提取数据库字段的描述信息)2017/12/4 17:16:17
    /// </summary>
    public class See_Code
    {
        #region " -------------------- Members -------------------- "
        private Int32 _ID;
        private string _Code;
        private Int32 _UserID;
        private Int32 _HospitalID;
        private Boolean _IsUse;
        private string _Par1;
        private string _Par2;

        #endregion

        #region " -------------------- Properties -------------------- "
        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public string Code
        {
            get
            {
                return _Code;
            }
            set
            {
                _Code = value;
            }
        }

        public Int32 UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }

        public Int32 HospitalID
        {
            get
            {
                return _HospitalID;
            }
            set
            {
                _HospitalID = value;
            }
        }

        public Boolean IsUse
        {
            get
            {
                return _IsUse;
            }
            set
            {
                _IsUse = value;
            }
        }

        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }

        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }


        #endregion
    }

    public class See_Seek
    {
        private Int32 _ID;
        private string _Kind;
        private string _Feature;
        private string _LossPlace;
        private string _Pay;
        private string _Contract;
        private string _XinNo;
        private string _City;
        private DateTime _CreateTime;
        private string _Par1;
        private string _Par2;

        public Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                _ID = value;
            }
        }

        public string Kind
        {
            get
            {
                return _Kind;
            }
            set
            {
                _Kind = value;
            }
        }
        public string Feature
        {
            get
            {
                return _Feature;
            }
            set
            {
                _Feature = value;
            }
        }
        public string LossPlace
        {
            get
            {
                return _LossPlace;
            }
            set
            {
                _LossPlace = value;
            }
        }
        public string Pay
        {
            get
            {
                return _Pay;
            }
            set
            {
                _Pay = value;
            }
        }
        public string Contract
        {
            get
            {
                return _Contract;
            }
            set
            {
                _Contract = value;
            }
        }
        public string XinNo
        {
            get
            {
                return _XinNo;
            }
            set
            {
                _XinNo = value;
            }
        }
        public string City
        {
            get
            {
                return _City;
            }
            set
            {
                _City = value;
            }
        }
        public DateTime CreateTime
        {
            get
            {
                return _CreateTime;
            }
            set
            {
                _CreateTime = value;
            }
        }
        public string Par1
        {
            get
            {
                return _Par1;
            }
            set
            {
                _Par1 = value;
            }
        }
        public string Par2
        {
            get
            {
                return _Par2;
            }
            set
            {
                _Par2 = value;
            }
        }


    }
}







