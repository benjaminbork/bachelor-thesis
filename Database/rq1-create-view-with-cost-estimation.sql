-- THIS CONTENT IS AI GENERATED, AS MENTIONED IN APPEDNIX A OF THE THESIS
create view
  public.rq1_with_cost_estimation as
select
  rq1.id,
  rq1.test_id,
  rq1.success,
  rq1.cloud_provider,
  rq1.region,
  rq1.run_time,
  rq1.function_name,
  rq1.allocated_memory,
  rq1.cpu_cores,
  rq1.execution_time,
  rq1.latency,
  rq1.was_cold_start,
  case
    when rq1.test_id ~~ '%aws%'::text then 1000000::double precision * ceil(rq1.execution_time / 1::double precision) * 0.0000000067::double precision + case
      when rq1.latency < 500 then 0::double precision
      when rq1.latency >= 500
      and rq1.latency < 1000 then 0.05::double precision * (
        1000000::double precision * ceil(rq1.execution_time / 1::double precision) * 0.0000000067::double precision
      )
      when rq1.latency >= 1000 then 0.10::double precision * (
        1000000::double precision * ceil(rq1.execution_time / 1::double precision) * 0.0000000067::double precision
      )
      else 0::double precision
    end
    when rq1.test_id ~~ '%azure%'::text then (1000000::numeric * 0.000016 * 0.512)::double precision * ceil(rq1.execution_time / 100::double precision) / 10::double precision * 1.1::double precision + case
      when rq1.latency < 500 then 0::double precision
      when rq1.latency >= 500
      and rq1.latency < 1000 then 0.05::double precision * (
        (1000000::numeric * 0.000016 * 0.512)::double precision * ceil(rq1.execution_time / 100::double precision) / 10::double precision * 1.1::double precision
      )
      when rq1.latency >= 1000 then 0.10::double precision * (
        (1000000::numeric * 0.000016 * 0.512)::double precision * ceil(rq1.execution_time / 100::double precision) / 10::double precision * 1.1::double precision
      )
      else 0::double precision
    end
    when rq1.test_id ~~ '%gcp%'::text then 1000000::double precision * (
      ceil(rq1.execution_time / 100::double precision) / 10::double precision
    ) * (0.00000240 * 0.512 + 0.00002160 * 0.5833)::double precision + case
      when rq1.latency < 500 then 0::double precision
      when rq1.latency >= 500
      and rq1.latency < 1000 then 0.05::double precision * (
        1000000::double precision * (
          ceil(rq1.execution_time / 100::double precision) / 10::double precision
        ) * (0.00000240 * 0.512 + 0.00002160 * 0.5833)::double precision
      )
      when rq1.latency >= 1000 then 0.10::double precision * (
        1000000::double precision * (
          ceil(rq1.execution_time / 100::double precision) / 10::double precision
        ) * (0.00000240 * 0.512 + 0.00002160 * 0.5833)::double precision
      )
      else 0::double precision
    end
    else 0::double precision
  end as estimated_costs_per_1m
from
  rq1
order by
  rq1.test_id,
  rq1.execution_time;