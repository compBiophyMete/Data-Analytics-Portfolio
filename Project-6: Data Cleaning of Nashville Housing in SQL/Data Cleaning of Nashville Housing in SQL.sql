/*Cleaning Data in SQL Queries

*/

--Listing columns
PRAGMA table_info(Nashville);
--Standardize date format (YYYY-MM-DD)
SELECT SaleDate, strftime('%Y-%m-%d', SaleDate) AS ConvertedSaleDate FROM Nashville;

ALTER TABLE Nashville ADD COLUMN ConvertedSaleDate TEXT;

UPDATE Nashville
SET ConvertedSaleDate = strftime('%Y-%m-%d', SaleDate);


--Populate property address data 
SELECT * FROM Nashville ORDER BY ParcelID;


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, COALESCE(a.PropertyAddress, b.PropertyAddress) AS MissingPropertyAddress
FROM Nashville a
JOIN Nashville b ON a.ParcelID = b.ParcelID AND a.[UniqueID] <> b.[UniqueID]
WHERE a.PropertyAddress IS NULL;


UPDATE Nashville
SET PropertyAddress = COALESCE((SELECT b.PropertyAddress FROM Nashville b
WHERE Nashville.ParcelID = b.ParcelID AND Nashville.[UniqueID] <> b.[UniqueID]
AND b.PropertyAddress IS NOT NULL),
PropertyAddress
) WHERE PropertyAddress IS NULL;

--Breaking out Property Address into individual columns as Address &City
SELECT PropertyAddress From Nashville;

SELECT PropertyAddress, SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') -1) AS Address, SUBSTR(PropertyAddress,INSTR(PropertyAddress, ',')+1, length(PropertyAddress)) as Address FROM Nashville;

ALTER TABLE Nashville ADD SplittedPropertyAddress TEXT;

UPDATE Nashville SET SplittedPropertyAddress =  SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') -1) ;
SELECT * FROM Nashville;

ALTER TABLE Nashville ADD SplittedPropertyCity TEXT;

UPDATE Nashville SET SplittedPropertyCity = SUBSTR(PropertyAddress,INSTR(PropertyAddress, ',')+1, length(PropertyAddress));



SELECT * FROM Nashville;

--Change Y and N to Yes and No in "Sold as Vacant" field.
SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant) FROM Nashville;

UPDATE Nashville
SET SoldAsVacant = CASE 
                 WHEN SoldAsVacant = 'Y' THEN 'Yes'
                 WHEN SoldAsVacant = 'N' THEN 'No'
                  ELSE SoldAsVacant
             END;

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant) FROM Nashville;
-- Remove Duplicates

WITH RowNumCTE AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference ORDER by UniqueID ), row_num FROM PortfolioProject.dbo.NashvilleHousing )
DELETE * FROM RowNumCTE WHERE row_num > 1 ORDER by PropertyAddress
-- Remove the columns out of interest, which are TaxDistrict, PropertyAddress, SaleDate

SELECT * FROM Nashville; 

ALTER TABLE Nashville DROP COLUMN TaxDistrict, PropertyAddress, SaleDate;


