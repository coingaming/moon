defmodule Moon.Components.Datepicker.Helpers do
  @moduledoc false

  def format_date(nil, _), do: nil
  def format_date(date, true), do: Timex.format!(date, "%Y-%0m-%0dT%R", :strftime)
  def format_date(date, false), do: Timex.format!(date, "%Y-%0m-%0d", :strftime)

  def truncate_date(date) do
    date
    |> Timex.to_naive_datetime()
    |> NaiveDateTime.truncate(:second)
  end

  def format_to_date(datetime, true), do: datetime
  def format_to_date(datetime, false), do: Timex.to_naive_datetime(datetime)

  def dates_from_range("lastMonth", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(months: -1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  def dates_from_range("thisMonth", _) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  def dates_from_range("nextMonth", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(months: 1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  def dates_from_range("lastWeek", weekstart) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(weeks: -1)

    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  def dates_from_range("thisWeek", weekstart) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  def dates_from_range("nextWeek", weekstart) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(weeks: 1)

    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  def dates_from_range("last24hours", _) do
    date = Timex.now() |> truncate_date()
    {Timex.shift(date, hours: -24), date}
  end

  def dates_from_range("yesterday", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(days: -1)

    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  def dates_from_range("today", _) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  def dates_from_range("tomorrow", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(days: 1)

    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  def parse_date(""), do: nil

  def parse_date(date) when is_binary(date) do
    is_date_time_string = String.contains?(date, ["T"])

    if is_date_time_string do
      {:ok, datetime_result} = Timex.parse(date, "%Y-%0m-%0dT%R", :strftime)
      datetime_result
    else
      {:ok, date_result} = Timex.parse(date, "%Y-%0m-%0d", :strftime)
      date_result
    end
  end

  def parse_date(date), do: date
end
