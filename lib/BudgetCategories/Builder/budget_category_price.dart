class BudgetTrackerBuilder {
  String _categoryName;
  int _progressAmount;
  int _totalBudget;

  BudgetTrackerBuilder(
      this._categoryName, this._progressAmount, this._totalBudget);

  String get categoryName => _categoryName;
  set categoryName(String newCategoryName) {
    _categoryName = newCategoryName;
  }

  int get progressAmount => _progressAmount;
  set progressAmount(int newProgressAmount) {
    _progressAmount = newProgressAmount;
  }

  int get totalBudget => _totalBudget;
  set totalBudget(int newTotalBudget) {
    _totalBudget = newTotalBudget;
  } 
}

class ProgressBar {
  String _categoryName = ' ';
  int _progressAmount = 0;
  int _totalBudget = 0;

  ProgressBar(BudgetTrackerBuilder builder) {
    _categoryName = builder.categoryName;
    _progressAmount = builder.progressAmount;
    _totalBudget = builder.totalBudget;
  }

  String get categoryName => _categoryName;
  int get progressAmount => _progressAmount;
  int get totalBudget => _totalBudget;

  // To test whether each method works
  @override
  String toString() {
    return "The category of the budget is: $_categoryName\" The progress amount is: $_progressAmount\" The total budget is: $_totalBudget";
  }
}
