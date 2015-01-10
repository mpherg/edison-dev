edison-dev Cookbook
===================
Installs the Intel Edison SDK.

Requirements
------------
Currently this only works on Ubuntu 12.04.

Attributes
----------

Usage
-----
#### edison-dev::default
Just include `edison-dev` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[edison-dev]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Michael Ferguson <mpherg@gmail.com>
