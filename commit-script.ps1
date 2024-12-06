$start_date = Get-Date "2024-01-01"  # Start at January 1st
$end_date = Get-Date "2024-01-31"    # End at January 31st

# Loop through each day in January
while ($start_date -le $end_date) {
    Add-Content -Path README.md -Value "Fake commit on $($start_date.ToShortDateString())"  # Add fake content
    git add README.md  # Stage the file
    
    # Set the commit date for Git
    $env:GIT_AUTHOR_DATE = "$($start_date.ToString('yyyy-MM-dd')) 12:00:00"
    $env:GIT_COMMITTER_DATE = "$($start_date.ToString('yyyy-MM-dd')) 12:00:00"
    
    # Make the commit
    git commit -m "Commit on $($start_date.ToShortDateString())"
    
    # Move to the next day
    $start_date = $start_date.AddDays(1)
}
