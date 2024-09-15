-- THIS CONTENT IS AI GENERATED, AS MENTIONED IN APPEDNIX A OF THE THESIS
CREATE VIEW public.rq2_with_cost_estimation AS
SELECT
  rq2.id,
  rq2.test_id,
  rq2.success,
  rq2.cloud_provider,
  rq2.region,
  rq2.run_time,
  rq2.function_name,
  rq2.allocated_memory,
  rq2.cpu_cores,
  rq2.execution_time,
  rq2.latency,
  rq2.was_cold_start,
  CASE
    WHEN rq2.test_id LIKE '%aws%' THEN
      -- AWS cost calculation
      1000000 * CEIL(rq2.execution_time / 1) * 0.0000000067
      * (1 + 0.05 * FLOOR(rq2.latency / 500))
    WHEN rq2.test_id LIKE '%azure%' THEN
      -- Azure cost calculation
      (1000000 * 0.000016 * 0.512) * CEIL(rq2.execution_time / 100) / 10 * 1.1
      * (1 + 0.05 * FLOOR(rq2.latency / 500))
    WHEN rq2.test_id LIKE '%gcp%' THEN
      -- GCP cost calculation
      1000000 * (CEIL(rq2.execution_time / 100) / 10)
      * (0.00000240 * 0.512 + 0.00002160 * 0.5833)
      * (1 + 0.05 * FLOOR(rq2.latency / 500))
    ELSE
      0
  END AS estimated_costs_per_1m
FROM
  rq2
ORDER BY
  rq2.test_id,
  rq2.execution_time;
