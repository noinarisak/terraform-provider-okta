resource "okta_user" "test" {
  first_name = "TestAcc"
  last_name  = "Jones"
  login      = "john_replace_with_uuid@ledzeppelin.com"
  email      = "john_replace_with_uuid@ledzeppelin.com"

  lifecycle {
    ignore_changes = [group_memberships]
  }
}

## Test Case
resource "okta_group" "test" {
  name        = "testAcc_replace_with_uuid"
  description = "testing, testing"
}

resource "okta_group_membership" "test" {
  group_id = okta_group.test.id
  user_id  = okta_user.test.id
}
