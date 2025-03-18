if (multipass info aws-vm)
 then
  echo "The VM already exists"
 else
  echo "Creating a vm for you. One moment..."
  multipass launch --name aws-vm --mem 4G --disk 20G --cpus 2
  multipass info aws-vm
fi
