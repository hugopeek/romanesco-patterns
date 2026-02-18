<?php
/**
 * fbFormSubmissions Snippet
 *
 * Displays all submissions for a specific form in a Semantic UI table.
 *
 * Usage:
 * [[!fbFormSubmissions?
 *   &name=`contactForm`
 *   &limit=`20`
 *   &sortBy=`date`
 *   &sortDir=`DESC`
 * ]]
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

use Sterc\FormIt\Model\FormItForm;

// Load formit class
$formit = $modx->getService('formit', 'FormIt', $modx->getOption('formit.core_path', null, $modx->getOption('core_path') . 'components/formit/') . 'model/formit/');

// Load PDO Tools
$pdo = $modx->getService('pdoTools');

// Set snippet props
$formName = $modx->getOption('name', $scriptProperties);
$limit = $modx->getOption('limit', $scriptProperties, 10);
$sortBy = $modx->getOption('sortby', $scriptProperties, 'date');
$sortDir = $modx->getOption('sortdir', $scriptProperties, 'DESC');

// Get form objects
$q = $modx->newQuery(FormItForm::class);
$q->where([
    'form' => $formName,
]);
$forms = $modx->getCollection(FormItForm::class, $q);
$total = $modx->getCount(FormItForm::class, $q);


// Extract all unique field names from submissions
$fields = [];
foreach ($forms as $submission) {

    // Check if data is encrypted
    if ($submission->get('encrypted')) {
        $valuesJSON = $formit->decrypt($submission->get('values'));
    } else {
        $valuesJSON = $submission->get('values');
    }

    $values = json_decode($valuesJSON, true);

    if (is_array($values)) {
        foreach (array_keys($values) as $field) {
            if (!in_array($field, $fields)) {
                $fields[] = $field;
            }
        }
    }
}

if (empty($fields)) {
    return '<div class="ui error message">No fields found in submission data.</div>';
}

// Build the table HTML
$output = '
<table class="ui small compact celled table">
    <thead>
        <tr>';

$output .= '<th>Submitted</th>';
foreach ($fields as $field) {
    $output .= '<th>' . htmlspecialchars($field) . '</th>';
}

$output .= '
        </tr>
    </thead>
    <tbody>';

// Render table rows
foreach ($forms as $submission) {
    $output .= '<tr>';

    // Submission date
    $output .= '<td>' . date('Y-m-d H:i', $submission->get('date')) . '</td>';

    // Check if data is encrypted
    if ($submission->get('encrypted')) {
        $valuesJSON = $formit->decrypt($submission->get('values'));
    } else {
        $valuesJSON = $submission->get('values');
    }
    $values = json_decode($valuesJSON, true);
    if (!is_array($values)) {
        $values = [];
    }

    // Field values
    foreach ($fields as $field) {
        $value = (string)$values[$field] ?? '-';
        // Truncate long values
        if (strlen($value) > 50) {
            $value = substr($value, 0, 47) . '...';
        }
        $output .= '<td>' . htmlspecialchars($value) . '</td>';
    }

    $output .= '</tr>';
}

$output .= '
    </tbody>
</table>';

return $output;