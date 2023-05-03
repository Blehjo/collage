function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 82839;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 82839 > /dev/null;
done;

for child in $(list_child_processes 82849);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/blehjo/projects/planetninesolution/planetnine/bin/Debug/net7.0/fea447f3f0544ac3bf89de95ec2d4e53.sh;
