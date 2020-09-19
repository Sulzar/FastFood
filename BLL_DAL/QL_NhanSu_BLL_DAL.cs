using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BLL_DAL
{
    public class QL_NhanSu_BLL_DAL
    {
        dataFastFoodDataContext ch = new dataFastFoodDataContext();

        public QL_NhanSu_BLL_DAL()
        {
 
        }

        public IQueryable loadDataGridViewNhanVien()
        {
            return ch.QL_NguoiDungs.Select(t => t);
        }

        //public IQueryable<QL_NguoiDung> layNguoiDung()
        //{
        //    return ch.QL_NguoiDungs.Select(t => t);
        //}

        ////Tạo class để lấy ra 1 table mới kết hợp từ 2 table có sẵn
        //public class ManHinhPhanQuyen
        //{
        //    public string MaManHinh { get; set; }
        //    public string TenManHinh { get; set; }
        //    public bool CoQuyen { get; set; }
        //}

        //public IQueryable<ManHinhPhanQuyen> layManHinh(string manhom)
        //{
        //    //Table màn hình được hiển thị là kết hợp từ table ManHinh và table PhanQuyen
        //    //Khi cập nhật, cập nhật trên cả 2 table trên

        //    IQueryable<ManHinhPhanQuyen> qlmh_pq = (from mh in ch.QL_ManHinhs
        //                                            join  q in ch.QL_PhanQuyens on mh.MaMH equals q.MaMH
        //                                            where q.MaNhom == manhom
        //                                            select new ManHinhPhanQuyen
        //                                            {
        //                                                MaManHinh = mh.MaMH,
        //                                                TenManHinh = mh.TenMH,
        //                                                CoQuyen = Convert.ToBoolean(q.CoQuyen)
        //                                            });
        //    return qlmh_pq;
        //}

        //public IQueryable<QL_NguoiDungTrongNhom> layNguoiDungTrongNhom(string manhom)
        //{
        //    return ch.QL_NguoiDungTrongNhoms.Where(t => t.MaNhom == manhom);
        //}

        //public IQueryable<QL_NhomNguoiDung> layNhomNguoiDung()
        //{
        //    return ch.QL_NhomNguoiDungs.Select(t => t);
        //}

        //public IQueryable<QL_PhanQuyen> layPhanQuyen()
        //{           
        //    return ch.QL_PhanQuyens.Select(t => t);
        //}

        //public void themNhom(string manhom, string tennhom, string mamh, string tenmh)
        //{
        //    //Thêm 1 nhóm mới sẽ tạo ra 1 màn hình tương ứng, và mặc định không có quyền

        //    QL_NhomNguoiDung nhom = new QL_NhomNguoiDung();
        //    nhom.MaNhom = manhom;
        //    nhom.TenNhom = tennhom;
        //    ch.QL_NhomNguoiDungs.InsertOnSubmit(nhom);
        //    ch.SubmitChanges();
        //}

        //public void xoaNhom(string manhom, string mamh)
        //{
        //    //Nếu nhóm có tồn tại người dùng thì không thể xóa

        //    QL_NhomNguoiDung nhom = ch.QL_NhomNguoiDungs.Where(t => t.MaNhom == manhom).FirstOrDefault();
        //    QL_ManHinh mh = ch.QL_ManHinhs.Where(t => t.MaMH == mamh).FirstOrDefault();
        //    QL_PhanQuyen pq = ch.QL_PhanQuyens.Where(t => t.MaMH == mamh).FirstOrDefault();
        //    if (nhom != null && mh != null && pq != null)
        //    {
        //        ch.QL_NhomNguoiDungs.DeleteOnSubmit(nhom);
        //        ch.QL_ManHinhs.DeleteOnSubmit(mh);
        //        ch.QL_PhanQuyens.DeleteOnSubmit(pq);
        //        ch.SubmitChanges();
        //    }
        //}

        //public void suaNhom(string manhom, string tennhom, string mamh, string tenmh, bool quyen)
        //{
        //    //Được sửa tên nhóm, tên màn hình và quyền, không cho sửa mã

        //    QL_NhomNguoiDung nhom = ch.QL_NhomNguoiDungs.Where(t => t.MaNhom == manhom).FirstOrDefault();
        //    QL_PhanQuyen pq = ch.QL_PhanQuyens.Where(t => t.MaMH == mamh).FirstOrDefault();
        //    QL_ManHinh mh = ch.QL_ManHinhs.Where(t => t.MaMH == mamh).FirstOrDefault();
        //    if(nhom != null && pq != null && mh != null)
        //    {
        //        nhom.TenNhom = tennhom;
        //        mh.TenMH = tenmh;
        //        pq.CoQuyen = quyen;
        //        ch.SubmitChanges();
        //    }
        //}

        //public void themND(string mand, string tennd, string password, string dt, string hoatdong, string manhom, string ghichu)
        //{
        //    //Thêm người dùng mới sẽ phải chọn nhóm để có thể thêm người dùng

        //    QL_NguoiDung nd = new QL_NguoiDung();
        //    QL_NguoiDungTrongNhom nd_nhom = new QL_NguoiDungTrongNhom();
        //    nd.MaND = mand;
        //    nd.TenNguoiDung = tennd;
        //    nd.SoDienThoai = dt;
        //    nd.Password = password;
        //    nd.HoatDong = hoatdong;

        //    nd_nhom.MaNhom = manhom;
        //    nd_nhom.MaND = mand;
        //    nd_nhom.GhiChu = ghichu;

        //    ch.QL_NguoiDungs.InsertOnSubmit(nd);
           
        //    ch.SubmitChanges();
        //}

        //public void xoaND(string mand)
        //{
        //    //Khi xóa người dùng, xóa luôn người dùng đó trong table NguoiDungTrongNhom

        //    QL_NguoiDung nd = ch.QL_NguoiDungs.Where(t => t.MaND == mand).SingleOrDefault();
        
        //    if (nd != null)
        //    {
        //        ch.QL_NguoiDungs.DeleteOnSubmit(nd);
               
        //        ch.SubmitChanges();
        //    }
        //}

        //public void suaND(string mand, string tennd, string password, string dt, string hoatdong, string ghichu)
        //{
        //    //Update người dùng trong cả 2 table NguoiDung và NguoiDungTrongNhom

        //    QL_NguoiDung nd = ch.QL_NguoiDungs.Where(t => t.MaND == mand).SingleOrDefault();
        //    QL_NguoiDungTrongNhom nd_nhom = ch.QL_NguoiDungTrongNhoms.Where(t => t.MaND == mand).SingleOrDefault();
        //    if (nd != null)
        //    {
        //        nd.TenNguoiDung = tennd;
        //        nd.Password = password;
        //        nd.SoDienThoai = dt;
        //        nd.HoatDong = hoatdong;
        //        nd_nhom.GhiChu = ghichu;
        //        ch.SubmitChanges();
        //    }
        //}

        #region Method

        public IQueryable<QL_NhomNguoiDung> layNhomND()
        {
            return ch.QL_NhomNguoiDungs.Select(t => t);
        }
        
        // xoa nguoi dung
        public bool xoaNhomND(string manhom)
        {
            QL_NhomNguoiDung nnd = ch.QL_NhomNguoiDungs.SingleOrDefault(t => t.MaNhom == manhom);
           	        
		        if(ch.QL_PhanQuyens.Count(t => t.MaNhom == nnd.MaNhom) == 0 )
                {
                    foreach (QL_NguoiDung item in ch.QL_NguoiDungs.Where(t => t.MaNhom == nnd.MaNhom))
                    {
                        item.MaNhom = null;
                    }
                    ch.QL_NhomNguoiDungs.DeleteOnSubmit(nnd);                
                }

                else
                {
                    foreach (QL_PhanQuyen item in ch.QL_PhanQuyens.Where(t => t.MaNhom == nnd.MaNhom))
                    {
                        ch.QL_PhanQuyens.DeleteOnSubmit(item);
                    }

                    foreach (QL_NguoiDung item in ch.QL_NguoiDungs.Where(t => t.MaNhom == nnd.MaNhom))
                    {
                        item.MaNhom = null;
                    }
                    ch.QL_NhomNguoiDungs.DeleteOnSubmit(nnd);
                    submitChange();
                }
                return true;
	    
           
        }

        public bool themNhomND(QL_NhomNguoiDung nnd , List<QL_PhanQuyen> lstPQ)
        {
            try
            {
                ch.QL_NhomNguoiDungs.InsertOnSubmit(nnd);
                foreach (QL_PhanQuyen item in lstPQ)
                {
                  ch.QL_PhanQuyens.InsertOnSubmit(item);
                }
                
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool suaNhomND(QL_NhomNguoiDung nnd, List<QL_PhanQuyen> lstPQ)
        {
            try
            {
                QL_NhomNguoiDung nhom = ch.QL_NhomNguoiDungs.SingleOrDefault(t => t.MaNhom == nnd.MaNhom);
                nhom = nnd;
                if(lstPQ.Count == 0)
                {
                    submitChange();
                    return true;                    
                }
                else
                {
                    foreach (QL_PhanQuyen item in ch.QL_PhanQuyens.Where(t => t.MaNhom == nnd.MaNhom))
                    {
                        ch.QL_PhanQuyens.DeleteOnSubmit(item);
                    }
                    foreach (QL_PhanQuyen pq in lstPQ)
                    {
                        ch.QL_PhanQuyens.InsertOnSubmit(pq);
                    }
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        public IQueryable<QL_ManHinh> layMH()
        {
            //return (from mh in ch.QL_ManHinhs
            //        from pq in ch.QL_PhanQuyens
            //        where mh.MaMH == pq.MaMH
            //        select new {mh.MaMH,mh.TenMH,p});
            return ch.QL_ManHinhs.Select(t => t);
        }
        public List<QL_PhanQuyen> layMH(string maNhom)
        {
            List<QL_ManHinh> lst = layMH().ToList<QL_ManHinh>() ;
            List<QL_PhanQuyen> lstPQ = ch.QL_PhanQuyens.Where(t=>t.MaNhom == maNhom).ToList<QL_PhanQuyen>();
            foreach (QL_ManHinh item in lst)
            {
                QL_PhanQuyen pq = lstPQ.SingleOrDefault(t => t.MaMH == item.MaMH);
                if (pq == null)
                    continue;
                pq.TenManHinh = item.TenMH;
            }
            return lstPQ;
        }
        public void submitChange()
        {
            ch.SubmitChanges();
        }

        public List<QL_NguoiDung> loadListNhanVien()
        {
            return ch.QL_NguoiDungs.Select(t => t).ToList<QL_NguoiDung>();
        }

        public IQueryable loadCboNhomNhanVien()
        {
            return ch.QL_NhomNguoiDungs.Select(t => t);
        }

        public void themNhanVien(string ma, string tennguoidung, string sdt, string cmnd, string diachi, string email,
            DateTime ngaysinnh, DateTime ngayVL, string manhom, bool hoatdong, string matkhau)
        {
            QL_NguoiDung nd = new QL_NguoiDung();
            nd.MaND = ma;
            nd.TenNguoiDung = tennguoidung;
            nd.SoDienThoai = sdt;
            nd.CMND = cmnd;
            nd.DiaChi = diachi;
            nd.Email = email;
            nd.NgaySinh = Convert.ToDateTime(ngaysinnh);
            nd.NgayVL = Convert.ToDateTime(ngayVL);
            nd.MaNhom = manhom;
            //nd.HoatDong = Convert.ToBoolean(hoatdong);
            nd.Password = matkhau;
            ch.QL_NguoiDungs.InsertOnSubmit(nd);
            ch.SubmitChanges();
        }

        public void suaNhanVien(string ma, string tennguoidung, string sdt, string cmnd, string diachi, string email,
           DateTime ngaysinnh, DateTime ngayVL, string manhom, bool hoatdong, string matkhau)
        {
            QL_NguoiDung nd = ch.QL_NguoiDungs.Where(t => t.MaND == ma).FirstOrDefault();
            if (nd != null)
            {
                nd.MaND = ma;
                nd.TenNguoiDung = tennguoidung;
                nd.SoDienThoai = sdt;
                nd.CMND = cmnd;
                nd.DiaChi = diachi;
                nd.Email = email;
                nd.NgaySinh = Convert.ToDateTime(ngaysinnh);
                nd.NgayVL = Convert.ToDateTime(ngayVL);
                nd.MaNhom = manhom;
                //nd.HoatDong = Convert.ToBoolean(hoatdong);
                nd.Password = matkhau;
            }
            ch.SubmitChanges();
        }

        public void xoaNhanVien(string ma)
        {
            QL_NguoiDung nd = ch.QL_NguoiDungs.Where(t => t.MaND == ma).FirstOrDefault();
            if (nd != null)
            {
                ch.QL_NguoiDungs.DeleteOnSubmit(nd);
            }
            ch.SubmitChanges();
        }

        public IQueryable<QL_NguoiDung> loadGridViewTimKiemNhanVien(string txtTimKiem)
        {
            var nguoidung = from nd in ch.QL_NguoiDungs
                            where nd.MaND.Contains(txtTimKiem) ||
                            nd.TenNguoiDung.Contains(txtTimKiem) ||
                            nd.SoDienThoai.Contains(txtTimKiem) ||
                            nd.CMND.Contains(txtTimKiem) ||
                            nd.Email.Contains(txtTimKiem) ||
                            nd.DiaChi.Contains(txtTimKiem)
                            select nd;
            return nguoidung;
        }


        public int demSoLuong()
        {
            return ch.QL_NguoiDungs.Select(kh => kh).Count();
        }

        public int kiemTraKhoaChinh(string s)
        {
            return ch.QL_NguoiDungs.Where(a => a.MaND == s).Select(nd => nd).Count();
        }
 
            
        #endregion
    }
}
