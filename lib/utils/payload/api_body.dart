class Payload {
  static Map<String, dynamic> loginPayload = {
    'query': '''
        query List(\$filterOptions: ListDpiInput!) {
          DpiRate_List(FilterOptions: \$filterOptions) {
            list {
              _name
              _rate
              _id
            }
            totalCount
          }
        }
      ''',
    'variables': {
      "filterOptions": {
        "branchIds": "6631da5ce9efa0bd84a86852",
        "limit": -1,
        "skip": 0,
        "statusArray": [1]
      }
    }
  };
}
