class CloudBudgetsException implements Exception {
  const CloudBudgetsException();
}

// Create exception in CRUD
class CouldNotCreateBudgetException extends CloudBudgetsException {}

// Read exception in CRUD
class CouldNotGetAllBudgetsException extends CloudBudgetsException {}

// Update exception in CRUD
class CouldNotUpdateBudgetExcpetion extends CloudBudgetsException {}

// Delete exception in CRUD
class CouldNotDeleteBudgetException extends CloudBudgetsException {}
