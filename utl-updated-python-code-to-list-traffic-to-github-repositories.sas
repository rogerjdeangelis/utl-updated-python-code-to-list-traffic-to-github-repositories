%let pgm=utl-updated-python-code-to-list-traffic-to-github-repositories;

Updated python code to list traffic to github repositories

github no longer allows user and password authetification so my previous traffic code no longer works
also it appears that github3 is the best package not github?

github
https://tinyurl.com/3vzbenr3
https://github.com/rogerjdeangelis/utl-updated-python-code-to-list-traffic-to-github-repositories

deprecated becuse of change in github api
https://tinyurl.com/ybzbk7ez
https://github.com/rogerjdeangelis/utl_github_interface_for_traffic_analysis_using_Python_and_SAS

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

Github api token

You don't need userid or password

ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_pybegin;
parmcards4;
import os
import github3
gh = github3.login(token="ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
user = gh.me()
print(f"Listing repositories for user: {user.login}")
print(repo);
i=0
file = open('d:/txt/filename.txt', 'w')
for repo in gh.repositories_by(user):
    i=i+1;
    traffic = repo.views(per='day')
    file.write(f"Total views: {traffic.count} @ Repository: {repo.full_name}\n")
file.close()
;;;;
%utl_pyend;

data views;
length repo $255;
infile "d:/txt/filename.txt";
input;
views=input(scan(_infile_,2,':@'),5.);
repo=substr(_infile_,index(_infile_,'@')+14);
if views>0;
run;quit;

proc sql;
  reset outobs=20;
  create
    table top20 as
  select
    *
  from
    views
  order
    by views descending
;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_ ___
 / _ \| | | | __| `_ \| | | | __/ __|
| (_) | |_| | |_| |_) | |_| | |_\__ \
 \___/ \__,_|\__| .__/ \__,_|\__|___/
                |_|
*/
data views;
length repo $255;
infile "d:/txt/filename.txt";
input;
views=input(scan(_infile_,2,':@'),5.);
repo=substr(_infile_,index(_infile_,'@')+14);
if views>0;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  d:/txt/filename.txt                                                                                                   */
/*                                                                                                                        */
/*  Total views: 0 @ Repository: rogerjdeangelis/-utl-delete-dosubl-created-sas-macro-libraries                           */
/*  Total views: 0 @ Repository: rogerjdeangelis/Calculate-more-accurate-standard-deviation-as-quarters-are-added         */
/*  Total views: 0 @ Repository: rogerjdeangelis/Common-Format-and-MIME-Type-for-Comma-Separated-Values-CSV-Files         */
/*  Total views: 1 @ Repository: rogerjdeangelis/CostReports                                                              */
/*  Total views: 0 @ Repository: rogerjdeangelis/Creating-command-macros-for-the_1980s-DMS-Classic-Editor                 */
/*  Total views: 0 @ Repository: rogerjdeangelis/dedup-a-sorted-macro-list                                                */
/*  Total views: 0 @ Repository: rogerjdeangelis/Dynamic_variable_in_a_DOSUBL_execute_macro_in_SAS                        */
/*  Total views: 0 @ Repository: rogerjdeangelis/Elegant-simple-array-input-from-a-flatfile-by-Novinosrin                 */
/*  Total views: 0 @ Repository: rogerjdeangelis/excel-how-do-I-remove-troublesome-characters-before-importing            */
/*  Total views: 1 @ Repository: rogerjdeangelis/Export-exel-sheet-names-to-sas-dataset                                   */
/*  Total views: 0 @ Repository: rogerjdeangelis/Fastest-method-to-determine-if-a-column-contains-any-duplicates          */
/*  Total views: 0 @ Repository: rogerjdeangelis/generate_50_million_alphanumeric_unique_keys                             */
/*  Total views: 0 @ Repository: rogerjdeangelis/Median-of-all--maximum-payments-over-all-my-clients                      */
/*  Total views: 0 @ Repository: rogerjdeangelis/mySQL-uml-modeling-to-create-entity-diagrams-for-sas-datasets            */
/*  Total views: 0 @ Repository: rogerjdeangelis/ods_excel_does_not_always_honor_start_at--bug                            */
/*  Total views: 0 @ Repository: rogerjdeangelis/ods_rtf_mutiple_justifications_within_one_compute_block                  */
/*  Total views: 0 @ Repository: rogerjdeangelis/python_importing_sas_dataset_with_505_columns_and_100_thousand_rows      */
/*  Total views: 0 @ Repository: rogerjdeangelis/rogerjdeangelis.github.io                                                */
/*  Total views: 0 @ Repository: rogerjdeangelis/sasbcat                                                                  */
/*  Total views: 0 @ Repository: rogerjdeangelis/SASweave                                                                 */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Up to 40 obs from VIEWS total obs=183 04MAY2024:14:48:50                                                             */
/*                                                                                                                        */
/*   VIEWS                              REPOS                                                                             */
/*                                                                                                                        */
/*     2   rogerjdeangelis/-utl-delete-dosubl-created-sas-macro-libraries                                                 */
/*     1   rogerjdeangelis/Calculate-more-accurate-standard-deviation-as-quarters-are-added                               */
/*     1   rogerjdeangelis/Common-Format-and-MIME-Type-for-Comma-Separated-Values-CSV-Files                               */
/*     2   rogerjdeangelis/CostReports                                                                                    */
/*     4   rogerjdeangelis/Creating-command-macros-for-the_1980s-DMS-Classic-Editor                                       */
/*     1   rogerjdeangelis/dedup-a-sorted-macro-list                                                                      */
/*     1   rogerjdeangelis/Dynamic_variable_in_a_DOSUBL_execute_macro_in_SAS                                              */
/*     6   rogerjdeangelis/Elegant-simple-array-input-from-a-flatfile-by-Novinosrin                                       */
/*     1   rogerjdeangelis/excel-how-do-I-remove-troublesome-characters-before-importing                                  */
/*     1   rogerjdeangelis/Export-exel-sheet-names-to-sas-dataset                                                         */
/*     1   rogerjdeangelis/Fastest-method-to-determine-if-a-column-contains-any-duplicates                                */
/*     1   rogerjdeangelis/generate_50_million_alphanumeric_unique_keys                                                   */
/*    25   rogerjdeangelis/Median-of-all--maximum-payments-over-all-my-clients                                            */
/*     1   rogerjdeangelis/mySQL-uml-modeling-to-create-entity-diagrams-for-sas-datasets                                  */
/*     1   rogerjdeangelis/ods_excel_does_not_always_honor_start_at--bug                                                  */
/*    13   rogerjdeangelis/ods_rtf_mutiple_justifications_within_one_compute_block                                        */
/*     1   rogerjdeangelis/python_importing_sas_dataset_with_505_columns_and_100_thousand_rows                            */
/*     4   rogerjdeangelis/rogerjdeangelis.github.io                                                                      */
/*     2   rogerjdeangelis/sasbcat                                                                                        */
/*     2   rogerjdeangelis/SASweave                                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/*  Analysis Variable : VIEWS                                                                                             */
/*                                                                                                                        */
/*  Repos                                                                                                                 */
/*  with >                                                                                                                */
/*  0 views  Views     Views      Total                                                                                   */
/*   N       Minimum   Maximum    Views  Mean   Median  Quartile                                                          */
/*  ------------------------------------------------------------                                                          */
/*  183         1         68      873    4.87      1        3                                                             */
/*  ------------------------------------------------------------                                                          */
/*                                                                                                                        */
/*  Top 20 (out of 2,225)                                                                                                 */
/*                                                                                                                        */
/*  VIEWS    REPO                                                                                                         */
/*                                                                                                                        */
/*     68    rogerjdeangelis/utl-sas-r-inverted-bar-chart-with-lower-curve-plot-rainfall-runoff-plot                      */
/*     65    rogerjdeangelis/utl-scraping-a-web-page-with-three-by-three-set-of-finacial-tables                           */
/*     63    rogerjdeangelis/utl-substituting-name-and-label-to-column-headings-in-excel                                  */
/*     54    rogerjdeangelis/utl-scraping-AI-results-without-restriction-or-API-with-powershell-and-perplexity            */
/*     45    rogerjdeangelis/utl-end-to-end-cdisc-SDTM-ADaM-processing                                                    */
/*     38    rogerjdeangelis/utl-resolving-LINE-and-COLUMN-cannot-be-determined                                           */
/*     34    rogerjdeangelis/utl-simple-r-code-to-covert-excel-to-sas-and-sas-to-excel                                    */
/*     31    rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                      */
/*     25    rogerjdeangelis/utl-classic-matrix-problem-ordering-data-using-a-column-of-pointers-indirect-addressing      */
/*     22    rogerjdeangelis/utl-sas-to-and-from-sqllite-excel-ms-access-spss-stata-using-r-packages-without-sas          */
/*     16    rogerjdeangelis/utl_importing_r_created_v8_transport_files_into_sas_wps                                      */
/*     16    rogerjdeangelis/voodoo                                                                                       */
/*     15    rogerjdeangelis/utl-example-rtf-excel-and-pdf-reports-using-all-sas-provided-style-templates                 */
/*     15    rogerjdeangelis/utl-fun-with-infile-processing-without-an-input-file-or-datalines                            */
/*     15    rogerjdeangelis/utl-r-python-sas-sqlite-subtracting-the-means-of-a-specific-column-from-other-columns        */
/*     13    rogerjdeangelis/utl-complex-sql-query-we-really-do-not-need-null_or_nullif                                   */
/*     12    rogerjdeangelis/utl-without-ms-access-send-sas-dataset-to-access-subset-and-return-table-to-sas-rodbc        */
/*     11    rogerjdeangelis/utl-spaghetti-plots-in-sas-and-r-ggplot2-sgplot                                              */
/*     10    rogerjdeangelis/utl-sas-macro-to-combine-rtf-files-into-one-single-file                                      */
/*     10    rogerjdeangelis/utl_trajectory_of_drug_beneficiaries_for_general_practice_physicians                         */
/*     ...                                                                                                                */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

