In this project's scope, the Nashville Housing dataset was scrutinized for data wrangling. 

Herein, the dataset was cleaned in SQL in the following steps: 

* Standardizing  the date format as YYYY-MM-DD
* Populating property address data based on Parcel ID and Unique ID
* Splitting property address into individual columns of address and city
* Converting 'Y' and 'N' into 'Yes' and 'No' in the Sold as Vacant field
* Removing the duplicates in the dataset
* Removing the TaxDistrict, PropertyAddress, and SaleDate columns
