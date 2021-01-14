<?php
return [
    'store_id' => env('AAMARPAY_STORE_ID'),
    'signature_key' => env('AAMARPAY_KEY'),
    'sandbox' => env('AAMARPAY_SANDBOX'),
    'redirect_url' => [
        'success' => [
            'url' => env('AAMARPAY_SUCCESS_URL') // payment.success
        ],
        'cancel' => [
            'url' => env('AAMARPAY_CANCEL_URL') // payment/cancel or you can use route also
        ]
    ]
];

// return [
//     'store_id' => 'dailydeal',
//     'signature_key' =>'4e7e973fafe5aaac2e0b84fc3ee666c6',
//     'sandbox' => false,
//     'redirect_url' => [
//         'success' => [
//             'url' =>'payment.success' // payment.success
//         ],
//         'cancel' => [
//             'url' =>'payment.cancel' // payment/cancel or you can use route also
//         ],
//         'failed' => [
//             'url' =>'payment.failed' // payment/cancel or you can use route also
//         ]
        
//     ]
// ];
