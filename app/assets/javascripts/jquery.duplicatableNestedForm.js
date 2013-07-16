$(document).ready(function() {

    $('.duplicatable-nested-fields').each(function() {
        var $this = $(this);

        $this.find('.destroy-nested-fields').on('click', function(e) {
            $(this).parent('.nested-fields').remove();
        });

        $this.find('.duplicate-nested-fields').on('click', function(e) {
            e.preventDefault();

            var $lastNestedFields = $this.find('.nested-fields').last(),
                newNestedFields = $(nestedFields).clone(),
                nestedFieldsCount = $this.find('.nested-fields').size();

            $(newNestedFields).find('label').each(function() {
                var oldLabel = $(this).attr('for'),
                    newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_" + nestedFieldsCount + "_");

                $(this).attr('for', newLabel);
            });

            $(newNestedFields).find('select, input, textarea').each(function() {
                var oldId = $(this).attr('id'),
                    newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + nestedFieldsCount + "_");

                $(this).attr('id', newId);

                var oldName = $(this).attr('name'),
                    newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + nestedFieldsCount + "]");

                $(this).attr('name', newName);
            });

            $(newNestedFields).find('.existing-record-id').remove();

            $(newNestedFields).insertAfter($lastNestedFields);
        });

        var nestedFields = $this.find('.nested-fields').last().clone();
        $this.find('.destroy-nested-fields').remove();
    });

});