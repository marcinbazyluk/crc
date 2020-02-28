import os
from slackclient import SlackClient

# Variables
SLACK_TOKEN="xoxb-422328630679-528083705584-R5tdbdluzEpvPUeyYqetlEnh"
slack_client = SlackClient(os.environ.get('SLACK_TOKEN'))
sc = SlackClient(SLACK_TOKEN)

regular_import_out='../logs/regular/sysp_run_current.out'

def send_message(channel_name, message):
   sc.api_call(
         "chat.postMessage",
         channel=channel_name,
         text=message,
         username='importer',
         icon_emoji=':automation_bot:'
   )

def attach_file(channel_name, file_for_upload):
  with open(file_for_upload) as file_content:
    sc.api_call(
        "files.upload",
        channels=channel_name,
        file=file_content,
        username='importer',
        icon_emoji=':automation_bot:',
        title="File uploaded automatically by nmon importer tool"
    )

# Execution part:

#send_message('grafana-sysp', 'test' )
attach_file('grafana-sysp', regular_import_out)
