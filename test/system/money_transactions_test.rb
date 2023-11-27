require "application_system_test_case"

class MoneyTransactionsTest < ApplicationSystemTestCase
  setup do
    @money_transaction = money_transactions(:one)
  end

  test "visiting the index" do
    visit money_transactions_url
    assert_selector "h1", text: "Money transactions"
  end

  test "should create money transaction" do
    visit money_transactions_url
    click_on "New money transaction"

    fill_in "Amount", with: @money_transaction.amount
    fill_in "Name", with: @money_transaction.name
    fill_in "User", with: @money_transaction.user_id
    click_on "Create Money transaction"

    assert_text "Money transaction was successfully created"
    click_on "Back"
  end

  test "should update Money transaction" do
    visit money_transaction_url(@money_transaction)
    click_on "Edit this money transaction", match: :first

    fill_in "Amount", with: @money_transaction.amount
    fill_in "Name", with: @money_transaction.name
    fill_in "User", with: @money_transaction.user_id
    click_on "Update Money transaction"

    assert_text "Money transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Money transaction" do
    visit money_transaction_url(@money_transaction)
    click_on "Destroy this money transaction", match: :first

    assert_text "Money transaction was successfully destroyed"
  end
end
