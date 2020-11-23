Feature: Entity Clone author

  As an Editor when I clone content it is owned by me.

  Background:
    Given users:
      | name                   | status | uid    | mail                               | pass         | roles      |
      | test.editor            | 1      | 999999 | test.editor@example.com            | L9dx9IJz3'M* | Editor     |
      | test.editor.cloner     | 1      | 999998 | test.editor.cloner@example.com     | L9dx9IJz3'M* | Editor     |
      | test.site_admin.cloner | 1      | 999997 | test.site_admin.cloner@example.com | L9dx9IJz3'M* | Site Admin |
    And test content:
      | title             | path             | moderation_state | author      |
      | [TEST] Page title | /test-page-alias | published        | test.editor |

  @api @javascript
  Scenario: User who clones content is set as owner of the clone.
    Given I am logged in as "test.editor.cloner"
    When I edit test "[TEST] Page title"
    Then I see the text "Author test.editor"
    And I click "Clone"
    When I click on "#edit-clone" element
    When I edit test "[TEST] Page title - Cloned"
    Then I see the text "Author test.editor.cloner"
