class Account {
  String code;
  String name;
  bool isFavorite;

  Account({
    required this.code,
    required this.name,
    this.isFavorite = false,
  });
}

class AccountData {
  static List<Account> accounts = [
    // Add your account data here
    // Example:
    Account(code: '111', name: 'Tiền mặt'),
    Account(code: '112', name: 'Tiền gửi ngân hàng'),
    // ...
  ];

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
  }

  static List<Account> getSortedAccounts() {
    List<Account> favoriteAccounts = getFavoriteAccounts();
    List<Account> nonFavoriteAccounts = accounts.where((account) => !account.isFavorite).toList();

    nonFavoriteAccounts.sort((a, b) => a.code.compareTo(b.code));
    favoriteAccounts.sort((a, b) => a.code.compareTo(b.code));

    return [...favoriteAccounts, ...nonFavoriteAccounts];
  }
}
