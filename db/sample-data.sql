-- Sample data for dockets and document and cfrParts

-- =========================================
-- DOCKETS
-- =========================================

INSERT INTO dockets (
    docket_id,
    docket_api_link,
    agency_id,
    docket_category,
    docket_type,
    effective_date,
    flex_field1,
    flex_field2,
    modify_date,
    organization,
    petition_nbr,
    program,
    rin,
    short_title,
    flex_subtype1,
    flex_subtype2,
    docket_title,
    docket_abstract
) VALUES (
    'CMS-2025-0240',
    'https://api.regulations.gov/v4/dockets/CMS-2025-0240',
    'CMS',
    NULL,
    'Rulemaking',
    NULL,
    NULL,
    NULL,
    '2025-11-24T16:44:12Z',
    NULL,
    NULL,
    NULL,
    '0938-AV52',
    NULL,
    NULL,
    NULL,
    'CY 2026 Changes to the End-Stage Renal Disease (ESRD) Prospective Payment System and Quality Incentive Program.  CMS-1830-P',
    'This proposed rule would update and revise the End-Stage Renal Disease (ESRD) Prospective Payment System for calendar year 2026.  This rule also proposes to update the payment rate for renal dialysis services furnished by an ESRD facility to individuals with acute kidney injury.  In addition, this rule proposes to update requirements for the ESRD Quality Incentive Program and to terminate and modify requirements for the ESRD Treatment Choices Model.'
);

INSERT INTO dockets (
    docket_id,
    docket_api_link,
    agency_id,
    docket_category,
    docket_type,
    effective_date,
    flex_field1,
    flex_field2,
    modify_date,
    organization,
    petition_nbr,
    program,
    rin,
    short_title,
    flex_subtype1,
    flex_subtype2,
    docket_title,
    docket_abstract
) VALUES (
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/dockets/CMS-2025-0304',
    'CMS',
    NULL,
    'Rulemaking',
    NULL,
    NULL,
    NULL,
    '2025-11-28T17:04:15Z',
    NULL,
    NULL,
    NULL,
    '0938-AV50',
    NULL,
    NULL,
    NULL,
    'CY 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies (CMS-1832-P)',
    'This proposed rule addresses changes to the physician fee schedule and  Medicare Part B payment policies to ensure that payment systems are updated to reflect changes in medical practice, relative value of services, and changes in the statute; codification of new policies for the Medicare Prescription Drug Inflation Rebate Program under the Inflation Reduction Act of 2022; the Ambulatory Specialty Model; updates to the Medicare Diabetes Prevention Program expanded model; updates to drugs and biological products paid under Part B; Medicare Shared Savings Program requirements; updates to the Quality Payment Program; updates to policies for Rural Health Clinics and Federally Qualified Health Centers update to the Ambulance Fee Schedule regulations; codification of the Inflation Reduction Act and Consolidated Appropriations Act, 2023 provisions; and updates to the Medicare Promoting Interoperability Program.'
);

-- =========================================
-- DOCUMENTS
-- =========================================

INSERT INTO documents (
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0304-0001',
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/documents/CMS-2025-0304-0001',
    NULL,
    NULL,
    'CMS',
    FALSE, --idk this didn't have data (is_late_comment)
    NULL,
    NULL, -- comment_category had no data
    NULL,
    NULL,
    '2025-07-18T03:59:59Z',
    '2025-07-14T04:00:00Z',
    NULL,
    'Proposed Rule',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-07-18T09:00:30Z',
    FALSE,
    NULL,
    NULL,
    '2025-07-14T04:00:00Z',
    NULL,
    NULL,
    '2025-07-13T00:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Medicare and Medicaid Programs; CY 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program (CMS-1832-P)',
    NULL,
    FALSE,
    NULL
);

INSERT INTO documents (
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0304-0009',
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/documents/CMS-2025-0304-0009',
    NULL,
    NULL,
    'CMS',
    FALSE, --idk this didn't have data (is_late_comment)
    NULL,
    NULL, -- comment_category had no data
    NULL,
    NULL,
    '2025-09-13T03:59:59Z',
    '2025-07-16T04:00:00Z',
    NULL,
    'Proposed Rule',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-09-19T09:01:18Z',
    FALSE,
    NULL,
    NULL,
    '2025-07-16T04:00:00Z',
    NULL,
    NULL,
    '2025-07-16T04:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program',
    ARRAY[
        'Administrative Practices and Procedures',
        'Health Facilities',
        'Health Professions',
        'Medical Devices',
        'Medicare',
        'Reporting and Recordkeeping Requirements',
        'Rural Areas',
        'X-Rays',
        'Laboratories',
        'Biologics',
        'Drugs',
        'Emergency Medical Services',
        'Prescription Drugs',
        'Health Maintenance Organizations (HMO)',
        'Health Records',
        'Medicaid',
        'Penalties',
        'Privacy',
        'Health Care',
        'Health Insurance',
        'Intergovernmental Relations'
        ],
    FALSE,
    NULL
);

INSERT INTO documents (
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0304-1544',
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/documents/CMS-2025-0304-1544',
    NULL,
    NULL,
    'CMS',
    FALSE,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-09-13T03:59:59Z',
    '2025-08-14T04:00:00Z',
    NULL,
    'Proposed Rule',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-09-16T09:00:30Z',
    FALSE,
    NULL,
    NULL,
    '2025-08-14T04:00:00Z',
    NULL,
    NULL,
    '2025-08-14T04:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program; Correction',
    NULL,
    FALSE,
    NULL
);

INSERT INTO documents (
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0304-14108',
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/documents/CMS-2025-0304-14108',
    NULL,
    NULL,
    'CMS',
    FALSE,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-09-13T03:59:59Z',
    '2025-08-14T04:00:00Z',
    NULL,
    'Rule',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-11-06T18:23:15Z',
    FALSE,
    NULL,
    NULL,
    '2025-11-05T05:00:00Z',
    NULL,
    NULL,
    '2025-11-05T05:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program',
    ARRAY[
        'Administrative Practices and Procedures',
        'Health Facilities',
        'Health Professions',
        'Medical Devices',
        'Medicare',
        'Reporting and Recordkeeping Requirements',
        'Rural Areas',
        'X-Rays',
        'Laboratories',
        'Biologics',
        'Drugs',
        'Emergency Medical Services',
        'Prescription Drugs',
        'Health Maintenance Organizations (HMO)',
        'Health Records',
        'Medicaid',
        'Penalties',
        'Privacy',
        'Health Care',
        'Health Insurance',
        'Intergovernmental Relations'
        ],
    FALSE,
    NULL
);

INSERT INTO documents (
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0304-14109',
    'CMS-2025-0304',
    'https://api.regulations.gov/v4/documents/CMS-2025-0304-14109',
    NULL,
    NULL,
    'CMS',
    FALSE,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Rule',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-11-28T22:04:36Z',
    FALSE,
    NULL,
    NULL,
    '2025-11-28T05:00:00Z',
    NULL,
    NULL,
    '2025-11-28T05:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies Under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program; Correction',
    NULL,
    FALSE,
    NULL
);

INSERT INTO documents(
    document_id,
    docket_id,
    document_api_link,
    address1,
    address2,
    agency_id,
    is_late_comment,
    author_date,
    comment_category,
    city,
    comment,
    comment_end_date,
    comment_start_date,
    country,
    document_type,
    effective_date,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    implementation_date,
    last_name,
    modify_date,
    is_open_for_comment,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    receive_date,
    reg_writer_instruction,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    subtype,
    document_title,
    topics,
    is_withdrawn,
    postal_code
) VALUES (
    'CMS-2025-0240-0001',
    'CMS-2025-0240',
    'https://api.regulations.gov/v4/documents/CMS-2025-0240-0001',
    NULL,
    NULL,
    'CMS',
    FALSE,
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-07-03T03:59:59Z',
    '2025-06-30T04:00:00Z',
    NULL,
    'Proposed Rule',
    NULL,
    NULL,
    NULL,
    NULL,  -- flex_field1
    NULL,  -- flex_field2
    NULL,  -- first_name
    NULL,
    NULL,
    NULL,
    NULL,
    '2025-07-02T16:46:00Z',
    FALSE,
    NULL,
    NULL,
    '2025-06-30T04:00:00Z',
    NULL,
    NULL,
    '2025-06-30T04:00:00Z',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'CY 2026 Changes to the End-Stage Renal Disease (ESRD) Prospective Payment System and Quality Incentive Program. CMS1830-P Display',
    NULL,
    FALSE,
    NULL
);

-- =========================================
-- LINKS
-- =========================================

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    405,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-405?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    410,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-410?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    413,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-413?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    414,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-414?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    424,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-424?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    425,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-425?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    427,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-427?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    428,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-B/part-428?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    495,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-G/part-495?toc=1'
);

INSERT INTO links(
    title,
    cfrPart,
    link
) VALUES (
    42,
    512,
    'https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-H/part-512?toc=1'
);

-- =========================================
-- CFR PARTS
-- =========================================

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '405'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '410'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '414'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '424'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '425'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '427'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '428'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '495'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0001',
    NULL,
    42,
    '512'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '405'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '410'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '414'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '424'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '425'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '427'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-0009',
    '2025-13271',
    42,
    '428'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '405'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '410'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '414'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '424'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '425'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '427'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14108',
    '2025-19787',
    42,
    '428'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '405'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '410'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '414'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '424'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '425'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '427'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-14109',
    '2025-21458',
    42,
    '428'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-1544',
    '2025-15492',
    42,
    '405'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-1544',
    '2025-15492',
    42,
    '410'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-1544',
    '2025-15492',
    42,
    '414'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-1544',
    '2025-15492',
    42,
    '424'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0304-1544',
    '2025-15492',
    42,
    '425'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0240-0001',
    '2025-20681',
    42,
    '413'
);

INSERT INTO cfrParts(
    document_id,
    frDocNum,
    title,
    cfrPart
) VALUES (
    'CMS-2025-0240-0001',
    '2025-20681',
    42,
    '512'
);

INSERT INTO comments(
    comment_id,
    api_link,
    document_id,
    agency_id,
    document_type,
    posted_date,
    comment
) VALUES (
    'comment-0001',
    'http://example.com/comment/1',
    'CMS-2025-0240-0001',
    'CMS',
    'Public Submission',
    '2025-06-30T04:00:00Z',
    'This is a sample comment for testing'
);

INSERT INTO comments(
    comment_id,
    api_link,
    document_id,
    duplicate_comment_count,
    address1,
    address2,
    agency_id,
    city,
    comment_category,
    comment,
    country,
    docket_id,
    document_type,
    email,
    fax,
    flex_field1,
    flex_field2,
    first_name,
    submitter_gov_agency,
    submitter_gov_agency_type,
    last_name,
    modification_date,
    submitter_org,
    phone,
    posted_date,
    postmark_date,
    reason_withdrawn,
    received_date,
    restriction_reason,
    restriction_reason_type,
    state_province_region,
    comment_subtype,
    comment_title,
    is_withdrawn,
    postal_code
    )
    VALUES (
    'CMS-2025-0240-0017',
    'https://www.regulations.gov/comment/CMS-2025-0240-0017',
    'CMS-2025-0240-0001',
    0,
    Null,
    Null,
    'CMS',
    Null,
    'Association - Other',
    'Thank you for the opportunity to submit comments on the End-Stage Renal Disease Quality Incentive Program, specifically on the request for information on the measure concepts under consideration for future years. We at the Center to Advance Palliative Care (CAPC) applaud CMS for recognizing well-being as an important measure concept for patients living with end-stage kidney disease, as well as for their family caregivers. We would like to recommend that a new measure, "access to palliative care" be included as a quality measure for all beneficiaries over age 75 receiving dialysis. As you can see from the publication attached, The Case for Palliative Care in Kidney Care, the prevalence of many debilitating symptoms is quite high among patients receiving hemodialysis in the U.S., and palliative care has been proven to make significantly increase patient well-being by expertly managing these symptoms. Moreover, the involvement of specialty palliative care for the population on hemodialysis greatly reduces avoidable Medicare spending -- by those very improvements in patient and family well-being. In terms of measuring access to palliative care, we recommend that the denominator be limited to those aged 75 or older, as that is the population most likely to have complex co-morbidities and who can thus benefit most from palliative care services. For the numerator, the program might consider a claims-based measure, counting those patients with a Z 51.5 diagnosis code. (Note that while this Z code is not reliable across all Medicare beneficiaries, it is more likely to be valid for outpatient hemodialysis, particularly with CMS guidance on the use of the code.) CMS can pilot the measure and determine a national or regional baseline, and build the quality incentive targets from the baseline collected. Moreover, the use of "access to palliative care" as a quality measure is not unprecedented. Several private health plans use this in their own network quality incentive programs, as described in this blog: https://bettercareplaybook.org/_blog/2020/8/driving-improvements-hospital-care-through-palliative-care-quality-incentives. The measure concept has also been explored for inclusion in some past CMMI models. Thank you again for the opportunity to submit this recommendation. If you have questions or need further information, please contact Allison Silvers, Chief Health Care Transformation Officer at the Center to Advance Palliative Care at allison.silvers@mssm.edu.',
    NULL,
    'CMS-2025-0240',
    'Public Submission',
    Null,
    Null,
    Null,
    Null,
    Null,
    Null,
    Null,
    '2025-08-05T20:39:59Z',
    Null,
    Null,
    '2025-08-05T04:00:00Z',
    '2025-08-05T04:00:00Z',
    Null,
    FALSE,
    '2025-08-05T04:00:00Z',
    Null,
    Null,
    Null,
    'Public Comment',
    'Comment on CMS-2025-0240-0001',
    FALSE,
    Null
);
-- =========================================
-- FEDERAL REGISTER DOCUMENTS
-- =========================================
-- Made up for now until we have actual data

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0304',
    'CMS-2025-0304-0001',
    'CMS',
    'Medicare and Medicaid Programs; CY 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies (CMS-1832-P)',
    'Proposed Rule',
    NULL,
    '42',
    '405'
);

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0304',
    'CMS-2025-0304-0009',
    'CMS',
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program',
    'Proposed Rule',
    '2025-13271',
    '42',
    '405'
);

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0304',
    'CMS-2025-0304-1544',
    'CMS',
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program; Correction',
    'Proposed Rule',
    '2025-15492',
    '42',
    '405'
);

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0304',
    'CMS-2025-0304-14108',
    'CMS',
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program',
    'Rule',
    '2025-19787',
    '42',
    '405'
);

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0304',
    'CMS-2025-0304-14109',
    'CMS',
    'Medicare and Medicaid Programs: Calendar Year 2026 Payment Policies Under the Physician Fee Schedule and Other Changes to Part B Payment and Coverage Policies; Medicare Shared Savings Program Requirements; and Medicare Prescription Drug Inflation Rebate Program; Correction',
    'Rule',
    '2025-21458',
    '42',
    '405'
);

INSERT INTO federal_register_documents (
    docket_id,
    document_id,
    agency_id,
    document_title,
    document_type,
    fr_doc_num,
    cfr_title,
    cfr_part
) VALUES (
    'CMS-2025-0240',
    'CMS-2025-0240-0001',
    'CMS',
    'CY 2026 Changes to the End-Stage Renal Disease (ESRD) Prospective Payment System and Quality Incentive Program. CMS1830-P Display',
    'Proposed Rule',
    '2025-20681',
    '42',
    '413'
);

