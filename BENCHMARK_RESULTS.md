Benchmark

Benchmark run from 2024-08-07 12:22:08.156957Z UTC

## System

Benchmark suite executing on the following system:

<table style="width: 1%">
  <tr>
    <th style="width: 1%; white-space: nowrap">Operating System</th>
    <td>macOS</td>
  </tr><tr>
    <th style="white-space: nowrap">CPU Information</th>
    <td style="white-space: nowrap">Apple M2</td>
  </tr><tr>
    <th style="white-space: nowrap">Number of Available Cores</th>
    <td style="white-space: nowrap">8</td>
  </tr><tr>
    <th style="white-space: nowrap">Available Memory</th>
    <td style="white-space: nowrap">16 GB</td>
  </tr><tr>
    <th style="white-space: nowrap">Elixir Version</th>
    <td style="white-space: nowrap">1.16.3</td>
  </tr><tr>
    <th style="white-space: nowrap">Erlang Version</th>
    <td style="white-space: nowrap">26.2.5</td>
  </tr>
</table>

## Configuration

Benchmark suite executing with the following configuration:

<table style="width: 1%">
  <tr>
    <th style="width: 1%">:time</th>
    <td style="white-space: nowrap">5 s</td>
  </tr><tr>
    <th>:parallel</th>
    <td style="white-space: nowrap">1</td>
  </tr><tr>
    <th>:warmup</th>
    <td style="white-space: nowrap">2 s</td>
  </tr>
</table>

## Statistics



Run Time

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>

  <tr>
    <td style="white-space: nowrap">small</td>
    <td style="white-space: nowrap; text-align: right">33998.37</td>
    <td style="white-space: nowrap; text-align: right">0.0294 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;83.41%</td>
    <td style="white-space: nowrap; text-align: right">0.0286 ms</td>
    <td style="white-space: nowrap; text-align: right">0.0398 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">medium</td>
    <td style="white-space: nowrap; text-align: right">2332.84</td>
    <td style="white-space: nowrap; text-align: right">0.43 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;52.95%</td>
    <td style="white-space: nowrap; text-align: right">0.41 ms</td>
    <td style="white-space: nowrap; text-align: right">0.60 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">large</td>
    <td style="white-space: nowrap; text-align: right">186.01</td>
    <td style="white-space: nowrap; text-align: right">5.38 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;15.53%</td>
    <td style="white-space: nowrap; text-align: right">5.19 ms</td>
    <td style="white-space: nowrap; text-align: right">8.67 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">huge</td>
    <td style="white-space: nowrap; text-align: right">14.06</td>
    <td style="white-space: nowrap; text-align: right">71.12 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;17.13%</td>
    <td style="white-space: nowrap; text-align: right">74.27 ms</td>
    <td style="white-space: nowrap; text-align: right">122.15 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">mega</td>
    <td style="white-space: nowrap; text-align: right">1.19</td>
    <td style="white-space: nowrap; text-align: right">837.63 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;7.06%</td>
    <td style="white-space: nowrap; text-align: right">810.75 ms</td>
    <td style="white-space: nowrap; text-align: right">932.07 ms</td>
  </tr>

</table>


Run Time Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">small</td>
    <td style="white-space: nowrap;text-align: right">33998.37</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">medium</td>
    <td style="white-space: nowrap; text-align: right">2332.84</td>
    <td style="white-space: nowrap; text-align: right">14.57x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">large</td>
    <td style="white-space: nowrap; text-align: right">186.01</td>
    <td style="white-space: nowrap; text-align: right">182.78x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">huge</td>
    <td style="white-space: nowrap; text-align: right">14.06</td>
    <td style="white-space: nowrap; text-align: right">2417.91x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">mega</td>
    <td style="white-space: nowrap; text-align: right">1.19</td>
    <td style="white-space: nowrap; text-align: right">28477.99x</td>
  </tr>

</table>