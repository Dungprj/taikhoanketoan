import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account.dart';

class AccountData {
  static late List<Account> accounts;
  static late String filePath;

  static Future<void> init() async {
    accounts = await _loadData();
  }

  static Future<List<Account>> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString('accounts');

    if (storedData != null) {
      // If there is stored data in SharedPreferences, use it
      Iterable decoded = json.decode(storedData);
      return List<Account>.from(decoded.map((x) => Account.fromJson(x)));
    } else {
      // If there is no stored data, use the initial account list
      return _getInitialAccounts();
    }
  }

  static List<Account> _getInitialAccounts() {
    return [

      Account(code:'111', name:'Tiền mặt'),
      Account(code:'112', name:'Tiền gửi Ngân hàng'),
      Account(code:'113', name:'Tiền đang chuyển'),
      Account(code:'121', name:'Chứng khoán kinh doanh'),
      Account(code:'128', name:'Đầu tư nắm giữ đến ngày đáo hạn'),
      Account(code:'131', name:'Phải thu của khách hàng'),
      Account(code:'133', name:'Thuế GTGT được khấu trừ'),
      Account(code:'136', name:'Phải thu nội bộ'),
      Account(code:'138', name:'Phải thu khác'),
      Account(code:'141', name:'Tạm ứng'),
      Account(code:'151', name:'Hàng mua đang đi đường'),
      Account(code:'152', name:'Nguyên liệu, vật liệu'),
      Account(code:'153', name:'Công cụ, dụng cụ'),
      Account(code:'154', name:'Chi phí sản xuất, kinh doanh dở dang'),
      Account(code:'155', name:'Thành phẩm'),
      Account(code:'156', name:'Hàng hóa'),
      Account(code:'157', name:'Hàng gửi đi bán'),
      Account(code:'158', name:'Hàng hoá kho bảo thuế'),
      Account(code:'161', name:'Chi sự nghiệp'),
      Account(code:'171', name:'Giao dịch mua bán lại trái phiếu chính phủ'),
      Account(code:'211', name:'Tài sản cố định hữu hình'),
      Account(code:'213', name:'Tài sản cố định vô hình'),
      Account(code:'214', name:'Hao mòn tài sản cố định'),
      Account(code:'217', name:'Bất động sản đầu tư'),
      Account(code:'221', name:'Đầu tư vào công ty con'),
      Account(code:'222', name:'Đầu tư vào công ty liên doanh, liên kết'),
      Account(code:'228', name:'Đầu tư khác'),
      Account(code:'229', name:'Dự phòng tổn thất tài sản'),
      Account(code:'241', name:'Xây dựng cơ bản dở dang'),
      Account(code:'242', name:'Chi phí trả trước'),
      Account(code:'243', name:'Tài sản thuế thu nhập hoãn lại'),
      Account(code:'244', name:'Cầm cố, thế chấp, ký quỹ, ký cược'),
      Account(code:'331', name:'Phải trả cho người bán'),
      Account(code:'333', name:'Thuế và các khoản phải nộp Nhà nước'),
      Account(code:'334', name:'Phải trả người lao động'),
      Account(code:'335', name:'Chi phí phải trả'),
      Account(code:'336', name:'Phải trả nội bộ'),
      Account(code:'337', name:'Thanh toán theo tiến độ kế hoạch hợp đồng xây dựng'),
      Account(code:'338', name:'Phải trả, phải nộp khác'),
      Account(code:'341', name:'Vay và nợ thuê tài chính'),
      Account(code:'343', name:'Trái phiếu phát hành'),
      Account(code:'344', name:'Nhận ký quỹ, ký cược'),
      Account(code:'347', name:'Thuế thu nhập hoãn lại phải trả'),
      Account(code:'352', name:'Dự phòng phải trả'),
      Account(code:'353', name:'Quỹ khen thưởng phúc lợi'),
      Account(code:'356', name:'Quỹ phát triển khoa học và công nghệ'),
      Account(code:'357', name:'Quỹ bình ổn giá'),
      Account(code:'411', name:'Vốn đầu tư của chủ sở hữu'),
      Account(code:'412', name:'Chênh lệch đánh giá lại tài sản'),
      Account(code:'413', name:'Chênh lệch tỷ giá hối đoái'),
      Account(code:'414', name:'Quỹ đầu tư phát triển'),
      Account(code:'417', name:'Quỹ hỗ trợ sắp xếp doanh nghiệp'),
      Account(code:'418', name:'Các quỹ khác thuộc vốn chủ sở hữu'),
      Account(code:'419', name:'Cổ phiếu quỹ'),
      Account(code:'421', name:'Lợi nhuận sau thuế chưa phân phối'),
      Account(code:'441', name:'Nguồn vốn đầu tư xây dựng cơ bản'),
      Account(code:'461', name:'Nguồn kinh phí sự nghiệp'),
      Account(code:'466', name:'Nguồn kinh phí đã hình thành TSCĐ'),
      Account(code:'511', name:'Doanh thu bán hàng và cung cấp dịch vụ'),
      Account(code:'515', name:'Doanh thu hoạt động tài chính'),
      Account(code:'521', name:'Các khoản giảm trừ doanh thu'),
      Account(code:'611', name:'Mua hàng'),
      Account(code:'621', name:'Chi phí nguyên liệu, vật liệu trực tiếp'),
      Account(code:'622', name:'Chi phí nhân công trực tiếp'),
      Account(code:'623', name:'Chi phí sử dụng máy thi công'),
      Account(code:'627', name:'Chi phí sản xuất chung'),
      Account(code:'631', name:'Giá thành sản xuất'),
      Account(code:'632', name:'Giá vốn hàng bán'),
      Account(code:'635', name:'Chi phí tài chính'),
      Account(code:'641', name:'Chi phí bán hàng'),
      Account(code:'642', name:'Chi phí quản lý doanh nghiệp'),
      Account(code:'711', name:'Thu nhập khác'),
      Account(code:'811', name:'Chi phí khác'),
      Account(code:'821', name:'Chi phí thuế thu nhập doanh nghiệp'),
      Account(code:'911', name:'Xác định kết quả kinh doanh')
      // ... add other accounts ...
    ];
  }

  static Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final String dataToSave = json.encode(accounts);
    prefs.setString('accounts', dataToSave);
  }

  static List<Account> searchAccounts(String keyword) {
    return getSortedAccounts().where((account) {
      return account.name.toLowerCase().contains(keyword.toLowerCase()) ||
          account.code.contains(keyword);
    }).toList();
  }

  static List<Account> getFavoriteAccounts() {
    return accounts.where((account) => account.isFavorite).toList();
  }

  static void toggleFavoriteStatus(Account account) {
    account.isFavorite = !account.isFavorite;
    saveData();
  }

  static List<Account> getSortedAccounts() {
    List<Account> favoriteAccounts = getFavoriteAccounts();
    List<Account> nonFavoriteAccounts =
    accounts.where((account) => !account.isFavorite).toList();

    nonFavoriteAccounts.sort((a, b) => a.code.compareTo(b.code));
    favoriteAccounts.sort((a, b) => a.code.compareTo(b.code));

    return [...favoriteAccounts, ...nonFavoriteAccounts];
  }
}
