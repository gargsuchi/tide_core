@tide
Feature: Fields for different Media types

  Ensure that all media types have the expected fields.

  @api @javascript
  Scenario: The Document media type has the expected fields (and labels where we can use them).
    Given I am logged in as a user with the "create media" permission
    When I visit "media/add/document"
    Then I see field "Name"
    And I should see an "input#edit-name-0-value.required" element

    And I should see "Document" in the "label[for=edit-field-media-file-0-upload]" element
    And I should see an "label[for=edit-field-media-file-0-upload].form-required" element
    And I should see an "input#edit-field-media-file-0-upload" element

    And I should see "Allowed types: pdf doc docx xls xlsx xlsm csv txt ppt pptx dot dotm dotx." in the "#edit-field-media-file-0-upload--description" element

    And I should see "License" in the "label[for=edit-field-media-license]" element
    And I should see an "label[for=edit-field-media-license].form-required" element
    And I should see an "select#edit-field-media-license" element

    And I should see "Restricted" in the "label[for=edit-field-media-restricted-value]" element
    And I should not see an "label[for=edit-field-media-restricted-value].required" element
    And I should see an "input#edit-field-media-restricted-value" element

    And I should see "Audience" in the "label[for=edit-field-media-audience-0-target-id]" element
    And I should not see an "label[for=edit-field-media-audience-0-target-id].required" element
    And I should see an "input#edit-field-media-audience-0-target-id" element

    And I should see "Department" in the "label[for=edit-field-media-department-0-target-id]" element
    And I should not see an "label[for=edit-field-media-department-0-target-id].required" element
    And I should see an "input#edit-field-media-department-0-target-id" element

    And I should see "Topic" in the "label[for=edit-field-media-topic-0-target-id]" element
    And I should not see an "label[for=edit-field-media-topic-0-target-id].required" element
    And I should see an "input#edit-field-media-topic-0-target-id" element

  @api @javascript
  Scenario: The Image media type has the expected fields (and labels where we can use them).
    Given I am logged in as a user with the "create media" permission
    When I visit "media/add/image"
    Then I see field "Name"
    And I should see an "input#edit-name-0-value.required" element

    And I should see "Image" in the "label[for=edit-field-media-image-0-upload]" element
    And I should see an "label[for=edit-field-media-image-0-upload].form-required" element
    And I should see an "input#edit-field-media-image-0-upload" element
    And I should see "Allowed types: png gif jpg jpeg." in the "#edit-field-media-image-0-upload--description" element

    And I attach the file "SampleJPGImage_50kbmb.jpg" to "Image"
    And I wait for AJAX to finish
    Then I should see the text "Alternative text"
    And I should see the text "Title"

    And I should see "Caption" in the "label[for=edit-field-media-caption-0-value]" element
    And I should not see an "label[for=edit-field-media-caption-0-value].form-required" element
    And I should see an "input#edit-field-media-caption-0-value" element

    And I should see "Alignment" in the "label[for=edit-field-media-alignment]" element
    And I should not see an "label[for=edit-field-media-alignment].form-required" element
    And I should see an "select#edit-field-media-alignment" element

    And I should see "License" in the "label[for=edit-field-media-license]" element
    And I should see an "label[for=edit-field-media-license].form-required" element
    And I should see an "select#edit-field-media-license" element

    And I should see "Restricted" in the "label[for=edit-field-media-restricted-value]" element
    And I should not see an "label[for=edit-field-media-restricted-value].required" element
    And I should see an "input#edit-field-media-restricted-value" element

    And I should see "Audience" in the "label[for=edit-field-media-audience-0-target-id]" element
    And I should not see an "label[for=edit-field-media-audience-0-target-id].required" element
    And I should see an "input#edit-field-media-audience-0-target-id" element

    And I should see "Department" in the "label[for=edit-field-media-department-0-target-id]" element
    And I should not see an "label[for=edit-field-media-department-0-target-id].required" element
    And I should see an "input#edit-field-media-department-0-target-id" element

    And I should see "Topic" in the "label[for=edit-field-media-topic-0-target-id]" element
    And I should not see an "label[for=edit-field-media-topic-0-target-id].required" element
    And I should see an "input#edit-field-media-topic-0-target-id" element
    
  @api
  Scenario: The Video media type has the expected fields (and labels where we can use them).
    Given I am logged in as a user with the "create media" permission
    When I visit "media/add/video"
    Then I see field "Name"
    And I should see an "input#edit-name-0-value.required" element

    And I should see "Video" in the "label[for=edit-field-media-file-0-upload]" element
    And I should see an "label[for=edit-field-media-file-0-upload].form-required" element
    And I should see an "input#edit-field-media-file-0-upload" element

    And I should see "Allowed types: mp4." in the "#edit-field-media-file-0-upload--description" element

    And I should see "Length" in the "label[for=edit-field-media-length-0-value]" element
    And I should not see an "label[for=edit-field-media-length-0-value].form-required" element
    And I should see an "input#edit-field-media-length-0-value" element

    And I should see "Summary" in the "label[for=edit-field-media-summary-0-value]" element
    And I should not see an "label[for=edit-field-media-summary-0-value].form-required" element
    And I should see an "textarea#edit-field-media-summary-0-value" element

    And I should see "Transcript" in the "label[for=edit-field-media-transcript-0-value]" element
    And I should see an "label[for=edit-field-media-transcript-0-value].form-required" element
    And I should see an "textarea#edit-field-media-transcript-0-value" element

    And I should see "License" in the "label[for=edit-field-media-license]" element
    And I should see an "label[for=edit-field-media-license].form-required" element
    And I should see an "select#edit-field-media-license" element

    And I should see "Restricted" in the "label[for=edit-field-media-restricted-value]" element
    And I should not see an "label[for=edit-field-media-restricted-value].required" element
    And I should see an "input#edit-field-media-restricted-value" element

    And I should see text matching "Metadata"

    And I should see "Audience" in the "label[for=edit-field-media-audience-0-target-id]" element
    And I should not see an "label[for=edit-field-media-audience-0-target-id].required" element
    And I should see an "input#edit-field-media-audience-0-target-id" element

    And I should see "Department" in the "label[for=edit-field-media-department-0-target-id]" element
    And I should not see an "label[for=edit-field-media-department-0-target-id].required" element
    And I should see an "input#edit-field-media-department-0-target-id" element

    And I should see "Topic" in the "label[for=edit-field-media-topic-0-target-id]" element
    And I should not see an "label[for=edit-field-media-topic-0-target-id].required" element
    And I should see an "input#edit-field-media-topic-0-target-id" element
