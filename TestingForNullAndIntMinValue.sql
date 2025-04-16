Declare	@vendorMergeItemID INT = 1,
		@vendorSelfMergeID INT = 1

		select @vendorMergeItemID
		select @vendorSelfMergeID
    -- CHECK: Exactly 1 of @vendorSelfMergeID or @vendorMergeItemID must be passed
	IF (@vendorMergeItemID IS NULL AND @vendorSelfMergeID IS NULL
	 OR @vendorMergeItemID IS NOT NULL AND @vendorMergeItemID>(0) AND @vendorSelfMergeID IS NOT NULL AND @vendorSelfMergeID>(0)
	 OR @vendorMergeItemID IS NOT NULL AND @vendorMergeItemID<=(0) AND @vendorSelfMergeID IS NOT NULL AND @vendorSelfMergeID<=(0)
	 OR @vendorSelfMergeID IS NOT NULL AND @vendorSelfMergeID<=(0) AND @vendorMergeItemID IS NULL 
	 OR @vendorMergeItemID IS NOT NULL AND @vendorMergeItemID<=(0) AND @vendorSelfMergeID IS NULL)
		BEGIN
			Select ('Exactly 1 of @vendorSelfMergeID or @vendorMergeItemID must be populated')
		END
