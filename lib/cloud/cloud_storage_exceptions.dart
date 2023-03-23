class CloudStorageException implements Exception {
  const CloudStorageException();
}

// Create exception in CRUD
class CouldNotCreateException extends CloudStorageException {}

// Read exception in CRUD
class CouldNotGetAllExpensesException extends CloudStorageException {}

// Update exception in CRUD
class CouldNotUpdateExpenseExcpetion extends CloudStorageException {}

// Delete exception in CRUD
class CouldNotDeleteExpenseException extends CloudStorageException {}
