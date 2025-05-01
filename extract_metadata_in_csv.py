import json
import subprocess
import csv
import time

# Configuration
METADATA_JSON_PATH = 'metadataTypes.json'
CSV_OUTPUT_PATH = 'org_metadata_inventory.csv'
ORG_ALIAS = 'DevOrg-UnlockedPkg'  # Replace with your alias

def run_sfdx_listmetadata(metadata_type):
    try:
        result = subprocess.run(
            ['sfdx', 'force:mdapi:listmetadata', '--metadatatype', metadata_type, '-u', ORG_ALIAS, '--json'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        output = json.loads(result.stdout)
        if 'result' in output and output['status'] == 0:
            return output['result']
        else:
            return []
    except Exception as e:
        print(f"Error listing metadata for type {metadata_type}: {e}")
        return []

def main():
    with open(METADATA_JSON_PATH, 'r') as f:
        metadata_info = json.load(f)

    all_rows = []
    type_summary = {}

    for item in metadata_info.get('metadataObjects', []):
        metadata_type = item['xmlName']
        print(f"Processing: {metadata_type}")

        components = run_sfdx_listmetadata(metadata_type)
        count = 0
        if components:
            for comp in components:
                name = comp.get('fullName', '')
                ns = comp.get('namespacePrefix', '')
                modified_date = comp.get('lastModifiedDate', '')
                all_rows.append([metadata_type, name, ns, modified_date])
                count += 1

        type_summary[metadata_type] = count
        time.sleep(0.3)

    # Write to CSV
    with open(CSV_OUTPUT_PATH, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['MetadataType', 'ComponentName', 'Namespace', 'LastModifiedDate'])
        writer.writerows(all_rows)

        writer.writerow([])  # blank line
        writer.writerow(['MetadataType', 'Count'])  # summary header
        for k, v in sorted(type_summary.items()):
            writer.writerow([k, v])

    print(f"\n✅ Metadata inventory saved to {CSV_OUTPUT_PATH}")

if __name__ == "__main__":
    main()