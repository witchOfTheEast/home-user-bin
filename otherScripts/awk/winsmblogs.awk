# Parse Windows SMB Security .csv logs
BEGIN { FS="\t"; RS="\.\""}
{ print $1 }
