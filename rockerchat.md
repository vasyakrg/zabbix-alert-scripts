# Нужны:

- `apt install python python-pip`
- `pip install requests`

# Настройки скприпта

{ALERT.SENDTO}
{ALERT.MESSAGE}

# Действия:
- переименовываем `zabbix.domain.com` на свой домен

### Problem: {TRIGGER.NAME}

{
  "text": ":negative_squared_cross_mark: *{TRIGGER.NAME} ({ITEM.VALUE1})*",
  "attachments": [
    {
      "color": "#FF0000",
      "title": "[INCIDENT] {HOST.NAME}  ({HOST.CONN})",
      "title_link": "https://zabbix.domain.com/zabbix/tr_events.php?triggerid={TRIGGER.ID}&eventid={EVENT.ID}",
      "text": "Verified in {TIME}, at {EVENT.DATE}",
      "image_url": "https://zabbix.domain.com/zabbix/chart3.php?&width=900&height=200&period=3600&name={HOST.NAME}:{TRIGGER.NAME}&legend=1&items[0][itemid]={ITEM.ID}&items[0][drawtype]=5&items[0][color]=ff0000"
    }
  ]
}

### Resolved: {TRIGGER.NAME}

{
  "text": ":white_check_mark: *{TRIGGER.NAME} ({ITEM.VALUE1})*",
  "attachments": [
    {
      "color": "#00FF00",
      "title": "[OK] {HOST.NAME}  ({HOST.CONN})",
      "title_link": "https://zabbix.domain.com/zabbix/tr_events.php?triggerid={TRIGGER.ID}&eventid={EVENT.ID}",
      "text": "Verified in {TIME}, at {EVENT.DATE}",
      "image_url": "https://zabbix.domain.com/zabbix/chart3.php?&width=900&height=200&period=3600&name={HOST.NAME}:{TRIGGER.NAME}&legend=1&items[0][itemid]={ITEM.ID}&items[0][drawtype]=5&items[0][color]=00ff00"
    }
  ]
}
